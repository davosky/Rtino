class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  def index
    @q = Transfer.ransack(params[:q])
    @transfers = @q.result(distinct: true).order(transfer_date: "DESC").paginate(page: params[:page], per_page: 6)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @transfer = Transfer.find(params[:id])
    @totaltime = @transfer.arrival - @transfer.departure
    @totalminute = (@totaltime / 1.minute).round
    @totalhour = (@totaltime / 1.hour).round(2)
  end

  def new
    @transfer = Transfer.new
  end

  def edit
  end

  def create
    @transfer = Transfer.new(transfer_params)
    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: "Transfer was successfully created." }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: "Transfer was successfully updated." }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url, notice: "Transfer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_transfer
    @transfer = Transfer.find(params[:id])
  end

  def transfer_params
    params.require(:transfer).permit(:name, :transfer_date, :departure, :start_point, :start_address, :arrival, :destination, :destination_address, :path_lenght, :transport_id, :travel_time)
  end
end
