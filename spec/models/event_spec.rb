require 'spec_helper'

describe Event do
  
	before(:each) do
		@attr = {
			:description => "event description",
			:starttime => DateTime.new(2011,1,1,21,00,00), 
			:endtime => DateTime.new(2011,1,1,22,00,00),
			:date => Date.new(2011,1,1,22)
		}
	end
	
	
	describe "validation" do
	
		it "must have a date" do
			invalid_event = Event.create(@attr.merge(:date => nil))
			invalid_event.should_not be_valid
		end
	
		it "must have a stage" do
			event_with_no_stage = Event.create(@attr.merge(:stage => nil))
			event_with_no_stage.should_not be_valid
		end
		
		it "must have a band" do
			event_with_no_band = Event.create(@attr.merge(:band => nil))
			event_with_no_band.should_not be_valid
		end
		
		it "must have a starttime" do
			invalid_event = Event.create(@attr.merge(:starttime => nil))
			invalid_event.should_not be_valid
		end
		
		it "must have an endtime" do
			invalid_event = Event.create(@attr.merge(:endtime => nil))
			invalid_event.should_not be_valid
		end
		
		it "must not have an endtime before the starttime" do
			invalid_event = Event.create(@attr.merge(:endtime => DateTime.new(2011,1,1,21,00,00), :starttime => DateTime.new(2011,1,1,22,00,00)))
			invalid_event.should_not be_valid
		end
		
		it "must have an endtime after the starttime" do
			valid_event = Event.create((@attr.merge(:endtime => DateTime.new(2011,1,1,21,00,00), :starttime => DateTime.new(2011,1,1,20,00,00))))
			valid_event.should be_valid
		end
	
	end
	
	
	
	

  
end
