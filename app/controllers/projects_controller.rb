class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).order(project_priority: "ASC").where(user_id: current_user.id).where(project_status_id: 1).paginate(page: params[:page], per_page: 6)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def completed
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).order(start_date: "DESC").where(user_id: current_user.id).where(project_status_id: 2).paginate(page: params[:page], per_page: 6)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :start_date, :end_date, :project_typology_id, :project_priority, :project_description, :location_id, :structure_id, :office_id, :project_status_id, :user_id, tasks_attributes: Task.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
