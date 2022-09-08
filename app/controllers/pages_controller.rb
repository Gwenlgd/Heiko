require "json"
require "open-uri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :calendar ]

  def home
  end

  def calendar
  end

  def jules_api
    # url = "https://api.spoonacular.com/recipes/641166/nutritionLabel&apiKey=567252aada1e4f7b9480f8d21d58c7fd"
    # user_serialized = URI.open(url).read
    # @data = JSON.parse(user_serialized)
    @food_items = FoodItem.where.not(nutrients: nil)
  end

  def week_report

    @mood_count = ReportMood
                    .joins(:report)
                    .where('date >= ? AND date <= ? AND user_id = ?', Date.today() - 7.day, Date.today(), 15)
                    .group(:mood_id)
                    .count
    # I: Filter just the mood that occurs more than equal to 2 times a week
    @mood_count_often = @mood_count.select { |key, value| value >= 2 }

    # Find the report related to this mood and the food they consume on those days
     @food_consumed_mood = Report
                      .where(id: ReportMood.where(mood_id: @mood_count_often.keys).pluck(:report_id))
                      .joins(:report_food_items)
                      .group(:food_item_id)
                      .count

    # I: top food consumed most when the mood occurs
    @top_food_consumed_mood = @food_consumed_mood.sort_by { |key, value| -value }.to_h

    # link food item and intolerances in common
    # @food_consumed.each do |key, value|
      # @intolerance =

      # result = RestClient.post("https://api.spoonacular.com/recipes/parseIngredients?ingredientList=1 serving #{food_item.name}&apiKey=407c4040afde4095884ae9acad7d8e23&includeNutrition=true", { }, { content_type: :json})
      # result = JSON.parse(result.body)
      # nutrients = result[0]["nutrition"]["nutrients"]
      # list = ["Carbohydrates", "Fat", "Protein", "Fiber", "Sugar"].map do |nutrient|
        # info = nutrients.find { |n| n["name"] == nutrient }

        # next unless info

        # {
          # info["name"] => info["amount"] * 100
        # }
      # end

    # end

    # result = ReportFoodItem.joins(:report).where('date >= ? AND date <= ? AND user_id = ?', Date.today() - 7.day, Date.today(), 15).joins('INNER JOIN report_moods AS rm ON rm.report_id = repo
    #   rts.id').select('report_food_items.food_item_id, reports.id, rm.mood_id')
  # end

    # To get the symptoms and foods of user in the past 7 days
    @feeling_count = ReportFeeling
                    .joins(:report)
                    .where('date >= ? AND date <= ? AND user_id = ?', Date.today() - 7.day, Date.today(), 15)
                    .group(:feeling_id)
                    .count

    # I: Filter just the symptom that occurs more than equal to 2 times a week
    @feeling_count_often = @feeling_count.select { |key, value| value >= 2 }

    # Find the report related to this symptom and the food they consume on those days
    @food_consumed_feeling = Report
    .where(id: ReportFeeling.where(feeling_id: @feeling_count_often.keys).pluck(:report_id))
    .joins(:report_food_items)
    .group(:food_item_id)
    .count

    # I: top food consumed most when the symptom occurs
    @top_food_consumed_feeling = @food_consumed_feeling.sort_by { |key, value| -value }.to_h

  end
end


# result = RestClient.post("https://api.spoonacular.com/recipes/parseIngredients?ingredientList=1 serving Apple&apiKey=567252aada1e4f7b9480f8d21d58c7fd&includeNutrition=true", { }, { content_type: :json})
# Carbs
# Fat
# Protein
# Fiber
# Sugar
