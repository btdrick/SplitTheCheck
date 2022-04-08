class VotesController < ApplicationController
  # POST /votes
  def create
    @vote = current_user.votes.new(vote_params)

    if !@vote.save
      flash[:notice] = @vote.errors.full_messages.to_sentence
    end

    redirect_to @vote.restaurant
  end

  private

  # Only allow a list of trusted parameters through.
  def vote_params
    params
      .require(:vote)
      .permit(:restaurant_id, :splits_check)
  end
end
