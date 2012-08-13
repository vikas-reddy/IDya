class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  
  field :body, type: String
  field :username, type: String

  validates :body, presence: true
  validates :username, presence: true

  embedded_in :commentable, polymorphic: true
end
