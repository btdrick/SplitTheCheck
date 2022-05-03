class CommentsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:create]

  # POST /restaurants/1/comments
  def create
    @comment = current_user.comments.new(comment_params)

    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end

    redirect_to @comment.restaurant
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(restaurant_id: params[:restaurant_id])
  end

end
