class ReportMoodsController < ApplicationController

  def show
    @moods = ReportMood.mood.name
  end

  def new
    @report_mood = ReportMood.new
    @moods = Mood.all
    @report = Report.find(params[:report_id])
  end

  def create
    @reports = Report.all
    @report = Report.find(params[:report_id])

    params[:report_mood][:mood_id].reject!(&:blank?)

    report_mood_params[:mood_id].each do |report_mood|
      @report_mood = ReportMood.new(mood_id: report_mood)
      @report_mood.report = @report
      @report_mood.save!
    end
    redirect_to report_path(@report)
  end

  private

  def report_mood_params
    params.require(:report_mood).permit(mood_id: [])
  end
end
