# == Schema Information
# Schema version: 20101031155334
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  passwordsalt       :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  admin              :boolean
#

class User < ActiveRecord::Base

attr_accessor :password
    attr_accessible :email, :password, :password_confirmation
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
    validates :email, :presence     => true,
					  :format       => { :with => email_regex },
					  :uniqueness   => { :case_sensitive => false }
	
	validates :password, :presence     => { :if => :password_required?},
                         :confirmation => { :if => :password_required?},
                         :length       => { :if => :password_required?, :within => 6..40 }
						 
	
						 
	before_save :encrypt_password  # => { :if => :password_is_updated?}
	
	cattr_reader :per_page
    @@per_page = 10
	

	
	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password) 
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

    def self.authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.passwordsalt == cookie_salt) ? user : nil
    end
	

	
	 
	private 
		def encrypt_password
		unless self.password.nil?
			self.passwordsalt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		  end
		end

		def encrypt(string)
			secure_hash("#{passwordsalt}--#{string}")
		end
	
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
		
    protected
       def password_required?
		  self.new_record?
       end
	   
	   def password_is_updated?
		   true
	   end


end
