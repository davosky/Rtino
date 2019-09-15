class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    @q = Office.ransack(params[:q])
    @offices = @q.result(distinct: true).order(position: "ASC").paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @office = Office.new
  end

  def edit
  end

  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to offices_path, notice: "Office was successfully created." }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to offices_path, notice: "Office was successfully updated." }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: "Office was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(:name, :position)
  end
end
