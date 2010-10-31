require "spec_helper"

describe FestivalsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/festivals" }.should route_to(:controller => "festivals", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/festivals/new" }.should route_to(:controller => "festivals", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/festivals/1" }.should route_to(:controller => "festivals", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/festivals/1/edit" }.should route_to(:controller => "festivals", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/festivals" }.should route_to(:controller => "festivals", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/festivals/1" }.should route_to(:controller => "festivals", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/festivals/1" }.should route_to(:controller => "festivals", :action => "destroy", :id => "1")
    end

  end
end
