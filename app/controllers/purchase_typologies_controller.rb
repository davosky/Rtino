class PurchaseTypologiesController < ApplicationController
  before_action :set_purchase_typology, only: [:show, :edit, :update, :destroy]

  def index
    @q = PurchaseTypology.ransack(params[:q])
    @purchase_typologies = @q.result(distinct: true).order(position: 'ASC').where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @purchase_typology = PurchaseTypology.new
  end

  def edit
  end

  def create
    @user = current_user
    @purchase_typology = @user.purchase_typologies.build(purchase_typology_params)

    respond_to do |format|
      if @purchase_typology.save
        format.html { redirect_to purchase_typologies_path, notice: 'Purchase typology was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_typology }
      else
        format.html { render :new }
        format.json { render json: @purchase_typology.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchase_typology.update(purchase_typology_params)
        format.html { redirect_to purchase_typologies_path, notice: 'Purchase typology was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_typology }
      else
        format.html { render :edit }
        format.json { render json: @purchase_typology.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase_typology.destroy
    respond_to do |format|
      format.html { redirect_to purchase_typologies_url, notice: 'Purchase typology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_purchase_typology
      @purchase_typology = PurchaseTypology.find(params[:id])
    end

    def purchase_typology_params
      params.require(:purchase_typology).permit(:name, :position, :user_id)
    end
end
