class Vote
  include Mongoid::Document  
  field :idea_id, type: Integer
  field :for_against, type: Boolean
  field :username, type: String

  belongs_to :idea

  # Votes related to "for"
  def forVotes
    where(for_against: true)
  end

  # Votes related to "against"
  def againstVotes
    where(for_against: false)
  end
end
