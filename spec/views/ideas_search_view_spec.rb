require 'spec_helper'
describe "ideas/search" do
  before(:each) do
    user = Object.new
    RR.stub(user).to_s { "kishoreke" }
    RR.stub(user).username { "kishoreke" }
    RR.stub(user).email { "kishore.ke@imaginea.com" }
    RR.stub(user).full_name { "kishore kemisetti" }
    RR.stub(view).current_user { user }
    assign(:user, user)
  end
  describe "test for invalid search" do
    it "should display error for invalid search" do
      assign(:valid_search, false)
      render
      view.should_not render_template(:partial => '_list')
    end
  end
  describe "valid search" do
    before(:each) do 
      assign(:valid_search, true)
    end
    it "should display message when no results are found" do
      ideas = []
      assign(:ideas, ideas)
      render
      rendered.should have_content(I18n.t(:no_results))
    end
    it "should display ideas when results are found" do
      idea = build(:idea)
      ideas = [idea, idea]
      RR.mock(ideas).current_page { 1 }
      RR.mock(ideas).num_pages { 1 }
      RR.mock(ideas).limit_value { 10 }
      assign(:ideas, ideas)
      render
      view.should render_template(:partial => '_list')
      rendered.should have_content(idea.title)
      rendered.should have_content(idea.description)
      rendered.should have_content(idea.username)
    end
  end
end
