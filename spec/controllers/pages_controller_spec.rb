require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    
    describe "as logged in user" do
      it "should be redirect to user page" do
        
        @user = Factory(:user)
        test_sign_in(@user)
        get 'home'
        response.should redirect_to(user_path(@user))
      end
    end
    
    describe "as non-logged in user" do
      it "should be successful" do
        get 'home'
        response.should be_success
      end    
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

end
