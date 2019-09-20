class StructuresController < ApplicationController
  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  def index
    @q = Structure.ransack(params[:q])
    @structures = @q.result(distinct: true).order(position: "ASC").where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @structure = Structure.new
  end

  def edit
  end

  def create
    @user = current_user
    @structure = @user.structures.build(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_to structures_path, notice: "Structure was successfully created." }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html { render :new }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @structure.update(structure_params)
        format.html { redirect_to structures_path, notice: "Structure was successfully updated." }
        format.json { render :show, status: :ok, location: @structure }
      else
        format.html { render :edit }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @structure.destroy
    respond_to do |format|
      format.html { redirect_to structures_url, notice: "Structure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_structure
    @structure = Structure.find(params[:id])
  end

  def structure_params
    params.require(:structure).permit(:name, :position, :user_id)
  end
end
