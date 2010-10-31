require 'spec_helper'

describe Festival do
    
  before(:each) do
    @attr = {
      :name => "here's the body of the post",
      :description => "The Post Title",
	  :startdate => '2011-07-07',
	  :enddate => '2011-07-10'
    }
  end
  
  it "should create a new instance given valid attribubtes" do
	Festival.create!(@attr)
  end
  
  describe "validations" do
  
  it "should require a name" do
	no_name_festival = Festival.new(@attr.merge(:name => ""))
	no_name_festival.should_not be_valid
  end
  
  it "should reject names that are too long" do
	long_name_festival = Festival.new(@attr.merge(:name => "a"*101))
	long_name_festival.should_not be_valid
  end
  
    it "should reject overly long descriptions" do
	  long_description = "a" * 251
	  hash = @attr.merge(:description => long_description)
	  Festival.new(hash).should_not be_valid
  end
  
  it "should require a startdate" do
	no_start_festival = Festival.new(@attr.merge(:startdate => ""))
	no_start_festival.should_not be_valid

  end
  
  it "should require an enddate" do
  	no_end_festival = Festival.new(@attr.merge(:enddate => ""))
	no_end_festival.should_not be_valid
  end
  
  it "should require start date to be the same as or older than end date" do
    invalid_festival = Festival.new(@attr.merge(:enddate => 2.days.ago, :startdate => 1.days.ago))
	invalid_festival.should_not be_valid
  end
  
  it "should allow start dates that are before the end date" do
    valid_festival = Festival.new(@attr.merge(:enddate => 1.days.ago, :startdate => 2.days.ago))
	valid_festival.should be_valid
  end
  
    it "should allow start dates that are the same as the end date" do
    valid_festival = Festival.new(@attr.merge(:enddate => 1.days.ago, :startdate => 1.days.ago))
	valid_festival.should be_valid
  end
  
  end
  
  describe "associations" do
  
  before(:each) do
	@festival = Festival.create!(@attr)
	@stage1 = Factory(:stage, :festival => @festival)
	@stage2 = Factory(:stage, :festival => @festival)
  end
  
  it "should have a stages attribute" do
	  @festival.should respond_to(:stages)
	end
	
	it "should have the right stages in ascending display order" do
	  @festival.stages.should == [@stage1, @stage2]
	end
	
	it "should destroy the festival's stages" do
	  @festival.destroy
	  [@stage1, @stage2].each do |stage|
	    Stage.find_by_id(stage.id).should be_nil
	  end
	end
  
  end
  
end
