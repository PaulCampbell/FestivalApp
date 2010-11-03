require 'spec_helper'

describe FestivalsController do

	describe "Get 'index'" do
	  
	  before(:each) do
	    	festival1 = Factory(:festival)
  			festival2 = Factory(:festival, :name => "festival 2")

  			@festivals = [festival1, festival2]
    end
	  
	  describe "for admin users" do
	
		before(:each) do
			@user = test_sign_in(Factory(:user, :admin => true))
		
		end
		
		it "should be successful" do
			get :index
			response.should be_success
		end
		
		it "should have an element for each festival" do
			get :index
			@festivals.each do |f|
				response.should have_selector("td", :content => f.name)
			end
		end
		
	end
	
	  describe "for signed in user" do
	    before(:each) do
	      @user = test_sign_in(Factory(:user))
      end

  		it "should be unsuccessful" do
  			get :index
  			response.should redirect_to(root_path)
  		end
      
    end
    
    describe "for non signed in user" do
      it "should be unsuccessful" do
    			get :index
    			response.should redirect_to(root_path)
    	end
    end
	
	end
 
end
