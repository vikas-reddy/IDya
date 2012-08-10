class Idea

  include Mongoid::Document
  include Mongoid::Timestamps

# Validations
	validates :title, presence: true, message: t('idea.title_presence')
	validates :description, presence: true, message: t('idea.description_presence')
  field :title, type: String
  field :description, type: String
  field :username, type: String

  has_many :improvisations
  has_many :votes, dependent: :delete
  embeds_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable

  scope :today, lambda { where(created_at: (Time.now.beginning_of_day)..(Time.now.end_of_day)) }
end
