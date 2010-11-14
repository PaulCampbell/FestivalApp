require 'spec_helper'

describe BandsController do
	render_views
	 
	describe "Get 'index'" do
	  
	  before(:each) do
	    	band1 = Factory(:band)
  			band2 = Factory(:band, :name => "Band 2")

  			@bands = [band1, band2]
    end
	  
	  describe "for admin users" do
	
		before(:each) do
			@user = test_sign_in(Factory(:user, :admin => true))
		
		end
		
		it "should be successful" do
			get :index
			response.should be_success
		end
		
		it "should have an element for each band" do
			get :index
			@bands.each do |band|
				response.should have_selector("tr", :content => band.name)
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
	
	
	 describe "GET 'show'" do

    before(:each) do
      @band = Factory(:band)
    end

    it "should be successful" do
      get :show, :id => @band
      response.should be_success
    end

    it "should find the right band" do
      get :show, :id => @band
      assigns(:band).should == @band
    end
     
  end 
  
  
   describe "GET 'new'" do
  
    describe "as a non signed in user" do

      
	  it "should redirect to the root" do
	    get :new
		response.should redirect_to(root_path)
	  end
	
	end
	
	
	describe "as a signed in user" do
	
	  before(:each) do
        @user = Factory(:user)
        test_sign_in(@user)
      end
	  
	 it "should be successful" do
        get :new
        response.should be_success
      end

  
	  
	end
	
  end
  
  
  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
         @user = Factory(:user)
          test_sign_in(@user)
        @attr = { :name => "", :description => "" }
      end

      it "should not create a band" do
        lambda do
          post :create, :band => @attr
        end.should_not change(Band, :count)
      end

      it "should render the 'new' page" do
        post :create, :band => @attr
        response.should render_template('new')
      end
	
    end
	
	describe "success" do

      before(:each) do
	      @user = Factory(:user)
        test_sign_in(@user)
		
        @attr = { :name => "band 1",
                  :description => "some sort of band description"}
      end

      it "should create a band" do
        lambda do
          post :create, :band => @attr
        end.should change(Band, :count).by(1)
      end

      it "should redirect to the band show page" do
        post :create, :band => @attr
        response.should redirect_to(band_path(assigns(:band)))
      end  
	    
    end
	
	describe "as a non signed in user" do
	
	  it "should redirect to the root page" do
	    @attr = { :name => "band 1",
                  :description => "some sort of band description"}

	    post :create, :band => @attr
		response.should redirect_to(root_path)
	  end
	end
	
  end

 
  describe "GET 'edit'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
	  @band = Factory(:band)
    end

    it "should be successful" do
      get :edit, :id => @band
      response.should be_success
    end

   
  end
  
  
  describe "PUT 'update'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)  
	    @band = Factory(:band)
    end

    describe "failure" do

      before(:each) do
        @attr = { :name => ""}
      end

      it "should render the 'edit' page" do
        put :update, :id => @band, :band => @attr
        response.should render_template('edit')
      end

    end

    describe "success" do

      before(:each) do
        @attr = { :name => "Pavement" }
      end

      it "should redirect to the band show page" do
        put :update, :id => @band, :band => @attr
        response.should redirect_to(band_path(@band))
      end

      it "should have a flash message" do
        put :update, :id => @band, :band => @attr
        flash[:success].should =~ /updated/
      end
    end
  end
  
  
  describe "authentication of edit/update pages" do

    before(:each) do
      @user = Factory(:user)
	  @band = Factory(:band)
    end

    describe "for non-signed-in users" do

      it "should deny access to 'edit'" do
        get :edit, :id => @band
        response.should redirect_to(root_path)
      end

      it "should deny access to 'update'" do
        put :update, :id => @band, :user => {}
        response.should redirect_to(root_path)
      end
    end
	
  end
  
  describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
	    @band = Factory(:band)
    end

    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @band
        response.should redirect_to(root_path)
      end
    end

    describe "as a non-admin user" do
      it "should protect the page" do
        test_sign_in(@user)
        delete :destroy, :id => @band
        response.should redirect_to(root_path)
      end
    end

    describe "as an admin user" do

      before(:each) do
        admin = Factory(:user, :email => "admin@example.com", :admin => true)
        test_sign_in(admin)
		    @band = Factory(:band)
      end

      it "should destroy the user" do
        lambda do
          delete :destroy, :id => @band
        end.should change(Band, :count).by(-1)
      end

      it "should redirect to the bands page" do
        delete :destroy, :id => @band
        response.should redirect_to(bands_path)
      end
    end
  end
end
