class TransportsController < ApplicationController
  before_action :set_transport, only: [:show, :edit, :update, :destroy]

  def index
    @transports = Transport.all
    @q = Transport.ransack(params[:q])
    @transports = @q.result(distinct: true).order(position: "ASC").where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @transport = Transport.new
  end

  def edit
  end

  def create
    @user = current_user
    @transport = @user.transports.build(transport_params)

    respond_to do |format|
      if @transport.save
        format.html { redirect_to transports_path, notice: "Transport was successfully created." }
        format.json { render :show, status: :created, location: @transport }
      else
        format.html { render :new }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transport.update(transport_params)
        format.html { redirect_to transports_path, notice: "Transport was successfully updated." }
        format.json { render :show, status: :ok, location: @transport }
      else
        format.html { render :edit }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transport.destroy
    respond_to do |format|
      format.html { redirect_to transports_url, notice: "Transport was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_transport
    @transport = Transport.find(params[:id])
  end

  def transport_params
    params.require(:transport).permit(:name, :position, :user_id)
  end
end
