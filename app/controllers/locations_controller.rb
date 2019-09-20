class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @q = Location.ransack(params[:q])
    @locations = @q.result(distinct: true).order(position: "ASC").where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @user = current_user
    @location = @user.locations.build(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_path, notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to locations_path, notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :position, :user_id)
  end
end
