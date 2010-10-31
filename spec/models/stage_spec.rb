require 'spec_helper'

describe Stage do
    before(:each) do
    @attr = {
      :name => "here's the body of the post",
      :description => "The Post Title",
	  :latitude => -1.34234,
	  :longitude => 56.345435
    }
	end
	
	describe "validation" do
		it "should require a name" do
			no_name_stage = Stage.create(@attr.merge(:name=>""))
			no_name_stage.should_not be_valid
		end
		
		it "should reject names that are too long" do
			long_name_stage = Stage.cr eate(@attr.merge(:name => "a"*101))
			long_name_stage.should_not be_valid
		end
	
	end
	
	describe "festival associations" do
	
	before(:each) do
	  @festival = Factory(:festival)
      @stage = @festival.stages.create(@attr)
    end
    
    it "should have a festival attribute" do
      @stage.should respond_to(:festival)
    end
    
    it "should have the correct festival associated" do
      @stage.festival_id.should == @festival.id
      @stage.festival.should == @festival
    end

	end
  
end
