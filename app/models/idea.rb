class Idea

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :username, type: String

  has_many :improvisations
  embeds_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable
  has_many :votes, dependent: :delete
end
