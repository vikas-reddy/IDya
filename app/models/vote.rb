class Vote
  include Mongoid::Document
  field :id, type: Integer
  field :idea_id, type: Integer
  field :for_against, type: Boolean
  field :user_id, type: Integer
end
