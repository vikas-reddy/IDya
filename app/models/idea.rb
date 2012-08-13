class Idea < MongoRecord
  
  field :title, type: String
  field :description, type: String
  field :username, type: String

  # Mass assignment only for title and description
  attr_accessible :title, :description

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :username, presence: true

  # Provide the fields for full text search using mongoid_search
  # Let's also include username, allowing user to search ideas by ldpa_id of the owner
  search_in :title, :description, :username

  has_many :improvisations
  embeds_many :votes
  embeds_many :comments, as: :commentable

  scope :today, lambda { where(created_at: (Time.now.beginning_of_day)..(Time.now.end_of_day)) }
  scope :last_week, lambda {where(created_at:(1.week.ago)..(Time.now.end_of_day))}
  scope :last_month, lambda {where(created_at:(1.month.ago)..(Time.now.end_of_day))}

  FilterCriteria = ["Today", "Last Week", "Last Month"]
  OrderCriteria  = ["Created Date", "Votes/Ratings", "Comments"]

  def self.filter(filter_by)
    filter_by = filter_by.to_sym
    filter_by = :scoped unless [:today, :last_week, :last_month].include?(filter_by)
    
    self.send(filter_by)
  end

  # set per_page for Ideas
  def self.per_page
    5
  end
end
