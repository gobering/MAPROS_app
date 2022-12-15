class FavoritesController < ApplicationController
  
  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(dangerous_spot_id: params[:dangerous_spot_id])
    redirect_to dangerous_spots_path, notice: "#{favorite.dangerous_spot.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to dangerous_spots_path, notice: "#{favorite.dangerous_spot.user.name}さんのブログをお気に入り解除しました"
  end
end
