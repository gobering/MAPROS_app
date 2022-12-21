class DangerousSpotsController < ApplicationController
  before_action :set_dangerous_spot, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 

  def index
    @dangerous_spots = DangerousSpot.all.page(params[:page]).per(5)
    gon.dangerous_spots = DangerousSpot.all
  end

  def show
    @favorite = current_user.favorites.find_by(dangerous_spot_id: @dangerous_spot.id)
  end

  def new
    @dangerous_spot = DangerousSpot.new
  end

  def edit
    gon.dangerous_spot = DangerousSpot.find(params[:id])
  end

  def create
    @dangerous_spot = current_user.dangerous_spots.build(dangerous_spot_params)

    respond_to do |format|
      if @dangerous_spot.save
        format.html { redirect_to dangerous_spots_path, notice: "登録完了！" }
        format.json { render :show, status: :created, location: @dangerous_spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dangerous_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dangerous_spot.update(dangerous_spot_params)
        format.html { redirect_to dangerous_spot_url(@dangerous_spot), notice: "編集完了！" }
        format.json { render :show, status: :ok, location: @dangerous_spot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dangerous_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dangerous_spot.destroy

    respond_to do |format|
      format.html { redirect_to dangerous_spots_url, notice: "削除完了！" }
      format.json { head :no_content }
    end
  end

  private

  def set_dangerous_spot
    @dangerous_spot = DangerousSpot.find(params[:id])
  end

  def dangerous_spot_params
    params.require(:dangerous_spot).permit(:address, :content, :detail, :latitude, :longitude, :user_id, :image, { label_ids: [] } )
  end
end
