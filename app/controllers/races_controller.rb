class RacesController < OpenReadController
  before_action :set_race, only: [:show, :update, :destroy]

  # GET /races
  def index
    @races = current_user.races.order(:race_day).reverse_order

    render json: @races
  end

  # GET /races/1
  def show
    render json: @race
  end

  # POST /races
  def create
    @race = current_user.races.build(race_params)

    if @race.save
      render json: @race, status: :created, location: @race
    else
      render json: @race.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /races/1
  def update
    if @race.update(race_params)
      render json: @race
    else
      render json: @race.errors, status: :unprocessable_entity
    end
  end

  # DELETE /races/1
  def destroy
    @race.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race
      @race = Race.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def race_params
      params.require(:race).permit(:name, :distance, :time, :race_day, :location, :user)
    end
end
