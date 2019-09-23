class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @q = Report.ransack(params[:q])
    @reports = @q.result(distinct: true).order(date: "DESC").where(user_id: current_user.id).paginate(page: params[:page], per_page: 6)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def pdfprint
    @user = current_user
    @q = Report.ransack(params[:q])
    @reports = @q.result(distinct: true).order(date: "DESC").where(user_id: current_user.id).paginate(page: params[:page], per_page: 100)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "reports/pdfprint", pdf: "pdfprint" }
    end
  end

  def pdfprintreport
    @user = current_user
    @q = Report.ransack(params[:q])
    @reports = @q.result(distinct: true).order(date: "DESC").where(user_id: current_user.id).paginate(page: params[:page], per_page: 100)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "reports/pdfprintreport", pdf: "pdfprintreport" }
    end
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new(report_params)
    @user = current_user
    @report = @user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:name, :date, :location_id, :structure_id, :user_id, assistances_attributes: Assistance.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
