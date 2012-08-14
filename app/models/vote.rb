class Vote

  include Mongoid::Document  

  field :idea_id, type: Integer
  field :for_against, type: Boolean
  field :username, type: String
  
  embedded_in :idea, inverse_of: :votes
  
  validates :username, presence: true

  after_create :save_aggregates

  def self.voted?(username)   
    where(username: username).blank? ? false : true
  end

  def for_vote?
    for_against == true
  end

  def save_aggregates
    if for_vote?
      idea.for_vote_count += 1
    else
      idea.against_vote_count += 1
    end
    idea.save
  end

end
