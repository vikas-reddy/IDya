module IdeasHelper
  def filters
    Idea::FILTERS.map {|x| [x, x.downcase.gsub(' ','_')]}
  end
end
