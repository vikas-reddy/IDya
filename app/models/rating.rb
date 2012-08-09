class Rating

  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer
  field :username, type: String

  embedded_in :ratable, polymorphic: true
end
