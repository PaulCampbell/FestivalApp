require 'spec_helper'

describe BandsController do

  def mock_band(stubs={})
    (@mock_band ||= mock_model(Band).as_null_object).tap do |band|
      band.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all bands as @bands" do
      Band.stub(:all) { [mock_band] }
      get :index
      assigns(:bands).should eq([mock_band])
    end
  end

  describe "GET show" do
    it "assigns the requested band as @band" do
      Band.stub(:find).with("37") { mock_band }
      get :show, :id => "37"
      assigns(:band).should be(mock_band)
    end
  end

  describe "GET new" do
    it "assigns a new band as @band" do
      Band.stub(:new) { mock_band }
      get :new
      assigns(:band).should be(mock_band)
    end
  end

  describe "GET edit" do
    it "assigns the requested band as @band" do
      Band.stub(:find).with("37") { mock_band }
      get :edit, :id => "37"
      assigns(:band).should be(mock_band)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created band as @band" do
        Band.stub(:new).with({'these' => 'params'}) { mock_band(:save => true) }
        post :create, :band => {'these' => 'params'}
        assigns(:band).should be(mock_band)
      end

      it "redirects to the created band" do
        Band.stub(:new) { mock_band(:save => true) }
        post :create, :band => {}
        response.should redirect_to(band_url(mock_band))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved band as @band" do
        Band.stub(:new).with({'these' => 'params'}) { mock_band(:save => false) }
        post :create, :band => {'these' => 'params'}
        assigns(:band).should be(mock_band)
      end

      it "re-renders the 'new' template" do
        Band.stub(:new) { mock_band(:save => false) }
        post :create, :band => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested band" do
        Band.should_receive(:find).with("37") { mock_band }
        mock_band.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :band => {'these' => 'params'}
      end

      it "assigns the requested band as @band" do
        Band.stub(:find) { mock_band(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:band).should be(mock_band)
      end

      it "redirects to the band" do
        Band.stub(:find) { mock_band(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(band_url(mock_band))
      end
    end

    describe "with invalid params" do
      it "assigns the band as @band" do
        Band.stub(:find) { mock_band(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:band).should be(mock_band)
      end

      it "re-renders the 'edit' template" do
        Band.stub(:find) { mock_band(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested band" do
      Band.should_receive(:find).with("37") { mock_band }
      mock_band.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bands list" do
      Band.stub(:find) { mock_band }
      delete :destroy, :id => "1"
      response.should redirect_to(bands_url)
    end
  end

end
