class VotesController < ApplicationController
  # POST /votes
  # POST /votes.json
  def create
    @idea = Idea.find(params[:idea_id])
    @vote = @idea.votes.new(params[:vote])
    @vote.username = current_user.to_s
    respond_to do |format|
      if @vote.save        
        format.json { render json: @vote, status: :created, location: @vote }
      else        
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end  
end
