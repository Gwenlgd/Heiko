require "json"
require "open-uri"
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :calendar ]
  def home
  end
  def calendar
  end
  #def jules_api
    # url = "https://api.spoonacular.com/recipes/641166/nutritionLabel&apiKey=567252aada1e4f7b9480f8d21d58c7fd"
    # user_serialized = URI.open(url).read
    # @data = JSON.parse(user_serialized)
    #@food_items = FoodItem.where.not(nutrients: nil)
  #end
  def week_report
    @bad_foods = []
    @good_foods = []
    @days = []
    (Date.today.beginning_of_week..Date.today.end_of_week).each do |date|
      report = current_user.reports.find_by(date: date)
      if report.present?
        if report.report_feelings.length.positive?
          @bad_foods << report.food_items
        else
          @good_foods << report.food_items
        end
        @days << report
      end
    end
    grouped_moods = {
    "Good" => ["Super happy", "Happy"],
    "Bad" => ["Sad", "Anxious", "Stressed", "Angry", "Grumpy", "Annoyed"]
    }
    @bad_foods.flatten!
    @good_foods.flatten!
    @sorted_day = @days.compact.sort_by { |report| report.feelings.length }
    @best_day = @sorted_day.select do |report|
      report.feelings.length.zero? &&
      !report.moods.pluck(:name).include?(grouped_moods["Bad"]) &&
      (
        report.moods.pluck(:name).include?(grouped_moods["Good"][0]) ||
        report.moods.pluck(:name).include?(grouped_moods["Good"][1])
      )
      end.first

    @worst_day = @sorted_day.last

    @feeling_count = ReportFeeling
    .joins(:report, :feeling)
    .where('date BETWEEN ? AND ? AND user_id = ?', Date.today.beginning_of_week, Date.today.end_of_week, current_user.id)
    .group('feelings.name')
    .count

    @popular_feelings = @feeling_count.sort_by { |key, value| value }.reverse.first(3).to_h


  end

  def month_report
    @bad_foods = []
    @good_foods = []
    @days = []
    (Date.today.beginning_of_month..Date.today.end_of_month).each do |date|
      report = current_user.reports.find_by(date: date)
      if report.present?
        if report.report_feelings.length.positive?
          @bad_foods << report.food_items
        else
          @good_foods << report.food_items
        end
        @days << report
      end
    end
    @bad_foods.flatten!
    @good_foods.flatten!
    grouped_moods = {"Good" => ["Super happy", "Happy"],
      "Bad" => ["Sad", "Anxious", "Stressed", "Angry", "Grumpy", "Annoyed"]
      }
      @sorted_day = @days.compact.sort_by { |report| report.feelings.length }
      @best_day = @sorted_day.select do |report|
        report.feelings.length.zero? &&
        !report.moods.pluck(:name).include?(grouped_moods["Bad"]) &&
        (
          report.moods.pluck(:name).include?(grouped_moods["Good"][0]) ||
          report.moods.pluck(:name).include?(grouped_moods["Good"][1])
        )
        end.first
      @worst_day = @sorted_day.last

    @feeling_count = ReportFeeling
    .joins(:report, :feeling)
    .where('date BETWEEN ? AND ? AND user_id = ?', Date.today.beginning_of_month, Date.today.end_of_month, current_user.id)
    .group('feelings.name')
    .count

    @popular_feelings = @feeling_count.sort_by { |key, value| value }.reverse.first(3).to_h

  end

end
