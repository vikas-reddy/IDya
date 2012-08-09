class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  field :id, type: Integer
  field :title, type: String
  field :description, type: Varchar
  field :user_id, type: Integer
end
