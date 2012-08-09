class Rating
  include Mongoid::Document
  field :id, type: Integer
  field :improvisation_id, type: Integer
  field :rated, type: Integer
  field :username, type: String
end
