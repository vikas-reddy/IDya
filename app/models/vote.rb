class Vote
  include Mongoid::Document  
  field :idea_id, type: Integer
  field :for_against, type: Boolean
  field :username, type: String
end
