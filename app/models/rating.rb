class Rating

  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer
  field :username, type: String

  embedded_in :ratable, polymorphic: true

  validates :score, presence: true, numericality: true, inclusion: {in: 1..5}
  validates :username, presence: true
end
