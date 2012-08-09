class Comment
  include Mongoid::Document
  field :id, type: Integer
  field :commentable_id, type: Integer
  field :commentable_type, type: String
  field :username, type: String
  field :description, type: Varchar
end
