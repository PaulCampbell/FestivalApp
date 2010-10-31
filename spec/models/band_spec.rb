require 'spec_helper'

describe Band do
  
  before(:each) do
	@attr = {
		:name => "The Levellers",
		:description => "Folk punk band formed in 1992.",
		:weblink => "http://www.google.com"
	}
  end
  
  describe "validation" do
	
	it "should have a name" do
		no_name_band = Band.create(@attr.merge(:name => ""))
		no_name_band.should_not be_valid
	end
	
	it "shoud reject long names" do
		long_name_band = Band.create(@attr.merge(:name => "a" * 151))
		long_name_band.should_not be_valid
	end
  
  end
  
end