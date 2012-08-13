class Improvisation

  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :username, type: String

  validates :username, presence: true

  belongs_to :idea
  embeds_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable
end
