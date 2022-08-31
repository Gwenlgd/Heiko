class ReportsController < ApplicationController
  before_action :set_report, only: [:show]

  def index
    @reports = Report.all
  end

  def show
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
