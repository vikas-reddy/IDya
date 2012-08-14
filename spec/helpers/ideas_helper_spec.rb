require 'spec_helper'

describe IdeasHelper do
  describe "#render_list_if" do
    it "should render error message if list is empty" do
      helper.render_list_if(true, []).should == I18n.t(:no_results)
    end
    it "should render ideas if list is not empty" do
      idea1 = build(:idea)
      idea2 = build(:idea)
      ideas = [idea1, idea2]
      user = Object.new
      RR.stub(user).to_s { "kishoreke" }
      RR.stub(user).username { "kishoreke" }
      RR.stub(user).email { "kishore.ke@imaginea.com" }
      RR.stub(user).full_name { "kishore kemisetti" }
      RR.mock(ideas).current_page { 1 }
      RR.mock(ideas).num_pages { 1 }
      RR.mock(ideas).limit_value { 10 }
      RR.stub(view).current_user { user }
      assign(:ideas, ideas)
      assign(:user, user)
      rendered = helper.render_list_if(true, ideas)
      rendered.should have_content idea1.title
      rendered.should have_content idea2.title
    end
  end
end
