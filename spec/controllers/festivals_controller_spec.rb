require 'spec_helper'

describe FestivalsController do

  def mock_festival(stubs={})
    (@mock_festival ||= mock_model(Festival).as_null_object).tap do |festival|
      festival.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all festivals as @festivals" do
      Festival.stub(:all) { [mock_festival] }
      get :index
      assigns(:festivals).should eq([mock_festival])
    end
  end

  describe "GET show" do
    it "assigns the requested festival as @festival" do
      Festival.stub(:find).with("37") { mock_festival }
      get :show, :id => "37"
      assigns(:festival).should be(mock_festival)
    end
  end

  describe "GET new" do
    it "assigns a new festival as @festival" do
      Festival.stub(:new) { mock_festival }
      get :new
      assigns(:festival).should be(mock_festival)
    end
  end

  describe "GET edit" do
    it "assigns the requested festival as @festival" do
      Festival.stub(:find).with("37") { mock_festival }
      get :edit, :id => "37"
      assigns(:festival).should be(mock_festival)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created festival as @festival" do
        Festival.stub(:new).with({'these' => 'params'}) { mock_festival(:save => true) }
        post :create, :festival => {'these' => 'params'}
        assigns(:festival).should be(mock_festival)
      end

      it "redirects to the created festival" do
        Festival.stub(:new) { mock_festival(:save => true) }
        post :create, :festival => {}
        response.should redirect_to(festival_url(mock_festival))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved festival as @festival" do
        Festival.stub(:new).with({'these' => 'params'}) { mock_festival(:save => false) }
        post :create, :festival => {'these' => 'params'}
        assigns(:festival).should be(mock_festival)
      end

      it "re-renders the 'new' template" do
        Festival.stub(:new) { mock_festival(:save => false) }
        post :create, :festival => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested festival" do
        Festival.should_receive(:find).with("37") { mock_festival }
        mock_festival.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :festival => {'these' => 'params'}
      end

      it "assigns the requested festival as @festival" do
        Festival.stub(:find) { mock_festival(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:festival).should be(mock_festival)
      end

      it "redirects to the festival" do
        Festival.stub(:find) { mock_festival(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(festival_url(mock_festival))
      end
    end

    describe "with invalid params" do
      it "assigns the festival as @festival" do
        Festival.stub(:find) { mock_festival(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:festival).should be(mock_festival)
      end

      it "re-renders the 'edit' template" do
        Festival.stub(:find) { mock_festival(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested festival" do
      Festival.should_receive(:find).with("37") { mock_festival }
      mock_festival.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the festivals list" do
      Festival.stub(:find) { mock_festival }
      delete :destroy, :id => "1"
      response.should redirect_to(festivals_url)
    end
  end

end
