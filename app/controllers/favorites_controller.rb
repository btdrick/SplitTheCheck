class FavoritesController < ApplicationController
  # POST /favorites
  def create
    @favorite = current_user.favorites.new(favorite_params)

    if !@favorite.save
      flash[:notice] = @favorite.errors.full_messages.to_sentence
    end

    redirect_to @favorite.restaurant
  end

  # DELETE /favorites/1
  def destroy
    @favorite = current_user.favorites.find(params[:id])
    restaurant = @favorite.restaurant

    @favorite.destroy

    redirect_to restaurant
  end

  private

  # Only allow a list of trusted parameters through.
  def favorite_params
    params
      .require(:favorite)
      .permit(:restaurant_id)
  end
end
