module ApplicationHelper

  def home_page_path
    logged_in? ? ideas_path : home_path
  end

end
