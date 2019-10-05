class ProjectTypologiesController < ApplicationController
  before_action :set_project_typology, only: [:show, :edit, :update, :destroy]

  def index
    @project_typologies = ProjectTypology.all

    @q = ProjectTypology.ransack(params[:q])
    @project_typologies = @q.result(distinct: true).order(position: 'ASC').where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @project_typology = ProjectTypology.new
  end

  def edit
  end

  def create
    @user = current_user
    @project_typology = @user.project_typologies.build(project_typology_params)

    respond_to do |format|
      if @project_typology.save
        format.html { redirect_to project_typologies_path, notice: 'Project typology was successfully created.' }
        format.json { render :show, status: :created, location: @project_typology }
      else
        format.html { render :new }
        format.json { render json: @project_typology.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_typology.update(project_typology_params)
        format.html { redirect_to project_typologies_path, notice: 'Project typology was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_typology }
      else
        format.html { render :edit }
        format.json { render json: @project_typology.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_typology.destroy
    respond_to do |format|
      format.html { redirect_to project_typologies_url, notice: 'Project typology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project_typology
      @project_typology = ProjectTypology.find(params[:id])
    end

    def project_typology_params
      params.require(:project_typology).permit(:name, :position)
    end
end
