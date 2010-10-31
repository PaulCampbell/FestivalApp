require 'spec_helper'

describe StagesController do

  def mock_stage(stubs={})
    (@mock_stage ||= mock_model(Stage).as_null_object).tap do |stage|
      stage.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all stages as @stages" do
      Stage.stub(:all) { [mock_stage] }
      get :index
      assigns(:stages).should eq([mock_stage])
    end
  end

  describe "GET show" do
    it "assigns the requested stage as @stage" do
      Stage.stub(:find).with("37") { mock_stage }
      get :show, :id => "37"
      assigns(:stage).should be(mock_stage)
    end
  end

  describe "GET new" do
    it "assigns a new stage as @stage" do
      Stage.stub(:new) { mock_stage }
      get :new
      assigns(:stage).should be(mock_stage)
    end
  end

  describe "GET edit" do
    it "assigns the requested stage as @stage" do
      Stage.stub(:find).with("37") { mock_stage }
      get :edit, :id => "37"
      assigns(:stage).should be(mock_stage)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created stage as @stage" do
        Stage.stub(:new).with({'these' => 'params'}) { mock_stage(:save => true) }
        post :create, :stage => {'these' => 'params'}
        assigns(:stage).should be(mock_stage)
      end

      it "redirects to the created stage" do
        Stage.stub(:new) { mock_stage(:save => true) }
        post :create, :stage => {}
        response.should redirect_to(stage_url(mock_stage))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved stage as @stage" do
        Stage.stub(:new).with({'these' => 'params'}) { mock_stage(:save => false) }
        post :create, :stage => {'these' => 'params'}
        assigns(:stage).should be(mock_stage)
      end

      it "re-renders the 'new' template" do
        Stage.stub(:new) { mock_stage(:save => false) }
        post :create, :stage => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested stage" do
        Stage.should_receive(:find).with("37") { mock_stage }
        mock_stage.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stage => {'these' => 'params'}
      end

      it "assigns the requested stage as @stage" do
        Stage.stub(:find) { mock_stage(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:stage).should be(mock_stage)
      end

      it "redirects to the stage" do
        Stage.stub(:find) { mock_stage(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(stage_url(mock_stage))
      end
    end

    describe "with invalid params" do
      it "assigns the stage as @stage" do
        Stage.stub(:find) { mock_stage(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:stage).should be(mock_stage)
      end

      it "re-renders the 'edit' template" do
        Stage.stub(:find) { mock_stage(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested stage" do
      Stage.should_receive(:find).with("37") { mock_stage }
      mock_stage.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the stages list" do
      Stage.stub(:find) { mock_stage }
      delete :destroy, :id => "1"
      response.should redirect_to(stages_url)
    end
  end

end
