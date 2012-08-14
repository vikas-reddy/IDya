require 'spec_helper'

describe IdeasController do

	describe "search" do
		it "should get search page" do
			get :search, q: "asdf"
			response.should be_success
		end
		
		it "should return empty results" do
			get :search, q: "pleasedontcreateanypostwiththisstringplesepleasepleasepleasepleaserfdklfj;alsdfjlksdjfljsdflkjsdflksdjf;lksadjf;lsdkjf;lsadkfj"
			response.should be_success
			assigns[:ideas].should be_empty
		end

		it "should not search for empty strings" do
			get :search, q: " "
			response.should be_success
			flash[:notice].should == I18n.t(:empty_search)
			assigns[:ideas].should be_nil #equal nil
		end

		it "should search for valid string" do
			get :search, q: "searchable"
			response.should be_success
			flash[:notice].should equal nil
			assigns[:ideas].should_not equal nil
			before_size = assigns[:ideas].size
			
			create(:idea, title: 'searchable')

			get :search, q: "searchable"
			response.should be_success
			flash[:notice].should equal nil
			assigns[:ideas].should_not equal nil
			after_size = assigns[:ideas].size

			(before_size+1).should == after_size
		end
	end
end
