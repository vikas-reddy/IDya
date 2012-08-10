require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "validations" do
		# test presence of title and description
		idea = Idea.new
		assert !idea.save

		assert_includes idea.errors[:title], I18n.t('errors.messages.blank')
		assert_includes idea.errors[:description], I18n.t('errors.messages.blank')
		assert_includes idea.errors[:username], I18n.t('errors.messages.blank')
	end
end
