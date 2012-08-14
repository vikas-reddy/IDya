require 'spec_helper'

describe IdeasController do
	it "should be invalid" do
		nil_idea = Idea.new
		empty_string = ""
		empty_idea = Idea.new(title: empty_idea, description: empty_string, username: empty_string)

		blank_error_message = I18n.t('errors.messages.blank')

		[nil_idea, empty_idea].each do |idea|
			idea.save.should equal false
			idea.errors[:title].should include(blank_error_message)
			idea.errors[:description].should include(blank_error_message)
			idea.errors[:username].should include(blank_error_message)
		end	
	end
end
