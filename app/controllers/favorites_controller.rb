class FavoritesController < ApplicationController
  
  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(dangerous_spot_id: params[:dangerous_spot_id])
    redirect_to dangerous_spot_path(favorite.dangerous_spot.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to dangerous_spot_path(favorite.dangerous_spot.id)
  end
end
