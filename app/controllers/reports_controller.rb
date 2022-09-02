class ReportsController < ApplicationController
  before_action :set_report, only: [:show]

  def index
    @reports = Report.all
  end

  def show
    @report_moods = @report.report_moods
    @report_feelings = @report.report_feelings
    @report_food_items = @report.report_food_items
  end


  def create
    @report = current_user.reports.find_by(date: Date.today)
    unless @report
      @report = Report.new(user_id: current_user.id, date: Date.today)
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
    elsif params[:category] == "Symptoms"
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
