class Improvisation

  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :username, type: String

  belongs_to :idea
  has_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable
end
