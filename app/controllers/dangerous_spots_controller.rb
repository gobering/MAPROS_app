class DangerousSpotsController < ApplicationController
  before_action :set_dangerous_spot, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 

  # GET /dangerous_spots or /dangerous_spots.json
  def index
    @dangerous_spots = DangerousSpot.all
    gon.dangerous_spots = DangerousSpot.all
  end

  # GET /dangerous_spots/1 or /dangerous_spots/1.json
  def show
    @favorite = current_user.favorites.find_by(dangerous_spot_id: @dangerous_spot.id)
  end

  # GET /dangerous_spots/new
  def new
    @dangerous_spot = DangerousSpot.new
  end

  # GET /dangerous_spots/1/edit
  def edit
    gon.dangerous_spot = DangerousSpot.find(params[:id])
  end

  # POST /dangerous_spots or /dangerous_spots.json
  def create
    @dangerous_spot = DangerousSpot.new(dangerous_spot_params)

    respond_to do |format|
      if @dangerous_spot.save
        format.html { redirect_to dangerous_spots_path, notice: "Dangerous spot was successfully created." }
        format.json { render :show, status: :created, location: @dangerous_spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dangerous_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dangerous_spots/1 or /dangerous_spots/1.json
  def update
    respond_to do |format|
      if @dangerous_spot.update(dangerous_spot_params)
        format.html { redirect_to dangerous_spot_url(@dangerous_spot), notice: "Dangerous spot was successfully updated." }
        format.json { render :show, status: :ok, location: @dangerous_spot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dangerous_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dangerous_spots/1 or /dangerous_spots/1.json
  def destroy
    @dangerous_spot.destroy

    respond_to do |format|
      format.html { redirect_to dangerous_spots_url, notice: "Dangerous spot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dangerous_spot
      @dangerous_spot = DangerousSpot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dangerous_spot_params
      params.require(:dangerous_spot).permit(:address, :content, :latitude, :longitude, :user_id, :image, { label_ids: [] } )
    end
end
