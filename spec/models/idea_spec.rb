require 'spec_helper'

describe Idea do
	it "should be invalid" do
		nil_idea = build(:nil_idea)
		empty_idea = build(:empty_idea)
		blank_error_message = I18n.t('errors.messages.blank')

		[nil_idea, empty_idea].each do |idea|
			idea.save.should equal false
			idea.errors[:title].should include(blank_error_message)
			idea.errors[:description].should include(blank_error_message)
			idea.errors[:username].should include(blank_error_message)
		end
	end
	it "should be valid" do
		valid_idea = build(:idea)
		valid_idea.save.should equal true
	end
end
