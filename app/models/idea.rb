class Idea

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :username, type: String

  has_many :improvisations
  has_many :comments, as: :commentable
  embeds_many :ratings, as: :ratable
end