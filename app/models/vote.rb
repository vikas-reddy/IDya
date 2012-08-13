class Vote
  include Mongoid::Document  
  field :idea_id, type: Integer
  field :for_against, type: Boolean
  field :username, type: String
  
  embedded_in :idea, :inverse_of => :votes 

  # Votes related to "for"
  def self.for_votes
    where(for_against: true).count
  end

  # Votes related to "against"
  def self.against_votes
    where(for_against: false).count
  end

  def self.voted?(username)   
    where(username: username).blank? ? false : true
  end
end
