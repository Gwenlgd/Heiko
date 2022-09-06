class ReportsController < ApplicationController
  before_action :set_report, only: [:show]

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @report_mood = ReportMood.new
    #@report_feeling = ReportFeeling.new
    @food_item = []
    @food_item_id = []
    @meal_type_name = []
    @report_food_items = @report.report_food_items.group_by {|report_food_item| report_food_item.meal_type}

    end
    # @report_moods = @report.report_moods
    # @report_feelings = @report.report_feelings


  def create
    if params[:date]
      date = params[:date].to_date
    else
      date = Date.today
    end
    @report = current_user.reports.find_by(date: date)

    unless @report
      @report = Report.new(user_id: current_user.id, date: date)
    end

    if params[:category] == "Breakfast"
      @report.meal_type = "Breakfast"
      if @report.save
        redirect_to new_report_report_food_item_path(@report)
      end
    elsif params[:category] == "Lunch"
      @report.meal_type = "Lunch"
      if @report.save
        redirect_to new_report_report_food_item_path(@report)
      end
    elsif params[:category] == "Dinner"
      @report.meal_type = "Dinner"
      if @report.save
        redirect_to new_report_report_food_item_path(@report)
      end
    elsif params[:category] == "Snacks"
      @report.meal_type = "Snacks"
      if @report.save
        redirect_to new_report_report_food_item_path(@report)
      end
    elsif params[:category] == "Drinks"
      @report.meal_type = "Drinks"
      if @report.save
        redirect_to new_report_report_food_item_path(@report)
      end
    elsif params[:category] == "Moods"
      if @report.save
        redirect_to new_report_report_mood_path(@report)
      end
    elsif params[:category] == "Feelings"
      if @report.save
        redirect_to new_report_report_feeling_path(@report)
      end
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
