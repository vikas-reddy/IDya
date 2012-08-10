class Idea
  FILTERS = ["Today", "Last Week", "Last Month"]
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :username, type: String

  has_many :improvisations
  embeds_many :votes
  embeds_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable

  scope :today, lambda { where(created_at: (Time.now.beginning_of_day)..(Time.now.end_of_day)) }
  scope :last_week, lambda {where(created_at:(1.week.ago)..(Time.now.end_of_day))}
  scope :last_month, lambda {where(created_at:(1.month.ago)..(Time.now.end_of_day))}
end
