module IdeasHelper
  def filter_criteria
    Idea::FilterCriteria.map {|x| [x, x.downcase.gsub(' ','_')]}
  end

  def order_criteria
    Idea::OrderCriteria.map {|x| [x, x.downcase.gsub(/ /, '_')]}
  end
	def render_list_if(valid, ideas)
		if valid && ideas.empty?
			t(:no_results)
		elsif valid
			render 'list' if valid
		end
	end
end
