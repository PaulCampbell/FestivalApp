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
  
end