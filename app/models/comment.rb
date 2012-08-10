class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  
  field :body, type: String
  field :username, type: String

  embeds_in :commentable, polymorphic: true
end
