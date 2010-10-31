require "spec_helper"

describe StagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/stages" }.should route_to(:controller => "stages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/stages/new" }.should route_to(:controller => "stages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/stages/1" }.should route_to(:controller => "stages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/stages/1/edit" }.should route_to(:controller => "stages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/stages" }.should route_to(:controller => "stages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/stages/1" }.should route_to(:controller => "stages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/stages/1" }.should route_to(:controller => "stages", :action => "destroy", :id => "1")
    end

  end
end
