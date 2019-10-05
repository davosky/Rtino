class ProjectStatusesController < ApplicationController
  before_action :set_project_status, only: [:show, :edit, :update, :destroy]

  def index
    @q = ProjectStatus.ransack(params[:q])
    @project_statuses = @q.result(distinct: true).order(position: 'ASC').where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @project_status = ProjectStatus.new
  end

  def edit
  end

  def create
    @user = current_user
    @project_status = @user.project_statuses.build(project_status_params)

    respond_to do |format|
      if @project_status.save
        format.html { redirect_to project_statuses_path, notice: 'Project status was successfully created.' }
        format.json { render :show, status: :created, location: @project_status }
      else
        format.html { render :new }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_status.update(project_status_params)
        format.html { redirect_to project_statuses_path, notice: 'Project status was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_status }
      else
        format.html { render :edit }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_status.destroy
    respond_to do |format|
      format.html { redirect_to project_statuses_url, notice: 'Project status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project_status
      @project_status = ProjectStatus.find(params[:id])
    end

    def project_status_params
      params.require(:project_status).permit(:name, :position)
    end
end
