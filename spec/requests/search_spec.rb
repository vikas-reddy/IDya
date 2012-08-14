require 'spec_helper'

describe "Search page" do
  describe "empty search" do
    it "should display error for empty searches" do
      visit '/ideas/search?q='
      page.should have_content I18n.t(:empty_search)
    end
  end
  describe "only spaces string" do
    it "should display error for searches with strings having only spaces" do
      visit '/ideas/search?q=  '
      page.should have_content I18n.t(:empty_search)
    end
  end
  describe "valid search" do

    it "should display results if present" do
      search_text = "searchableasdf"
      idea = create(:idea, title: search_text)
      pagepath = "/ideas/search?q=#{search_text}"
      visit pagepath
      page.should have_content idea.title
    end
  end
end
