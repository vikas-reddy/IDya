require 'spec_helper'
describe "ideas/search" do
  before(:each) do
    user = Object.new
    RR.stub(user).to_s { "kishoreke" }
    RR.stub(view).current_user { user }
  end
  describe "test for invalid search" do
    it "should display error for invalid search" do
      assign(:valid_search, false)
      render
      rendered.should have_content(I18n.t(:empty_search))
    end
  end
  describe "valid search" do
    before(:each) do 
      assign(:valid_search, true)
    end
    it "should display message when no results are found" do
      assign(:ideas, [])
      render
      rendered.should have_content(I18n.t(:no_results))
    end
    it "should display ideas when results are found" do
      idea = build(:idea)
      assign(:ideas, [idea, idea])
      render
      view.should render_template(:partial => '_list')
      rendered.should have_content(idea.title)
      rendered.should have_content(idea.description)
      rendered.should have_content(idea.username)
    end
  end
end
