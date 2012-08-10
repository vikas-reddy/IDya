class Idea < MongoRecord
	# allow only following attributes to be mass assigned from Idea.new(params[:idea])
	attr_accessible :title, :description

	# Validations
	validates :title, presence: true
	validates :description, presence: true
	validates :username, presence: true

  field :title, type: String
  field :description, type: String
  field :username, type: String

  has_many :improvisations
  has_many :votes, dependent: :delete
  embeds_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable

  scope :today, lambda { where(created_at: (Time.now.beginning_of_day)..(Time.now.end_of_day)) }
end
