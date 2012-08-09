class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :body, type: String
  field :username, type: String

  belongs_to :commentable, polymorphic: true
end
