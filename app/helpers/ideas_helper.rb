module IdeasHelper
  def filter_criteria
    Idea::FilterCriteria.map {|x| [x, x.downcase.gsub(' ','_')]}
  end

  def order_criteria
    Idea::OrderCriteria.map {|x| [x, x.downcase.gsub(/ /, '_')]}
  end
end
