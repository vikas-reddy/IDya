module ApplicationHelper

  def home_page_path
    logged_in? ? ideas_path : home_path
  end

  def format_votes(idea)
    content_tag :div, class: "idea-votes", id: "idea-votes-#{idea.id}" do
      (
        idea.votes.for_votes.to_s +
        content_tag(:i, '', class: "icon-thumbs-up") +
        ' ' +
        idea.votes.against_votes.to_s +
        content_tag(:i, '', class: "icon-thumbs-down")
      ).html_safe
    end
  end
end
