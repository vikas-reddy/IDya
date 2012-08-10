require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "validations" do
		# test presence of title and description
		idea = Idea.new
		assert !idea.save

		assert_includes idea.errors.on(:title), t('idea.title_presence')
		assert_includes idea.errors.on(:description), t('idea.description_presence')
end
