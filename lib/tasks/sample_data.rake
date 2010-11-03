require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin_user = User.create!(:name => "Paul Campbell",
                 :email => "paulgcampbell@gmail.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin_user.toggle!(:admin)
    
    4.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@decoratedworld.co.uk"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    User.all(:limit => 3).each do |user|
      1.times do
        user.festivals.create!(:description => Faker::Lorem.paragraphs(paragraph_count = 1), :name =>  Faker::Name.name, :startdate => 5.days.ago, :enddate => 2.days.ago)
      end
    end  
    
    
     Festival.all(:limit => 10).each do |festival|
        1.times do
          festival.stages.create!(:description => Faker::Lorem.paragraphs(paragraph_count = 2), :name =>  Faker::Name.name)
        end
      end
    
  end
end