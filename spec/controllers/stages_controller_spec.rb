require 'spec_helper'

describe StagesController do
  render_views
  
  describe "GET 'index'" do

      before(:each) do
		    @festival = Factory(:festival)
      end

      it "should be successful" do
        get :index, :festival_id => @festival.id 
        response.should be_success
      end

     end
	 
	 
	describe "GET 'show'" do

    before(:each) do
      @stage = Factory(:stage)
    end

    it "should be successful" do
      get :show, :id => @stage
      response.should be_success
    end

    it "should find the right stage" do
      get :show, :id => @stage
      assigns(:stage).should == @stage
    end
     
  end 

  
end