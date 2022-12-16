class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:dangerous_spot_id)
    @favorites = DangerousSpot.find(favorites)
    gon.favorites = DangerousSpot.find(favorites)
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
