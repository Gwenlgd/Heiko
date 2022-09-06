# SYMPTOMS CONTROLLER

class ReportFeelingsController < ApplicationController
  before_action :set_report_feeling, only: :destroy

  def show
    @feelings = ReportFeeling.feeling.name
  end

  def new
    @report_feeling = ReportFeeling.new
    @feelings_categories = Feeling.pluck(:category).uniq
    @report = Report.find(params[:report_id])
  end

  def create
    @reports = Report.all
    @report = Report.find(params[:report_id])

    params[:report_feeling][:feeling_id].reject!(&:blank?)

    report_feeling_params[:feeling_id].each do |report_feeling|
      @report_feeling = ReportFeeling.new(feeling_id: report_feeling)
      @report_feeling.report = @report
      @report_feeling.save!
    end
    redirect_to report_path(@report)
  end

  def destroy
    @report_feeling.destroy
    redirect_to report_path(@report_feeling.report), status: :see_other
  end

  private

  def set_report_feeling
    @report_feeling = ReportFeeling.find(params[:id])
  end

  def report_feeling_params
    params.require(:report_feeling).permit(feeling_id: [])
  end
end
