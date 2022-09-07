require "json"
require "open-uri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :calendar ]

  def home
  end

  def calendar
  end

  def jules_api
    url = "https://api.spoonacular.com/recipes/641166/nutritionLabel&apiKey=567252aada1e4f7b9480f8d21d58c7fd"
    user_serialized = URI.open(url).read
    @data = JSON.parse(user_serialized)
  end
end
# result = RestClient.post("https://api.spoonacular.com/recipes/parseIngredients?ingredientList=1 serving Apple&apiKey=567252aada1e4f7b9480f8d21d58c7fd&includeNutrition=true", { }, { content_type: :json})
# Carbs
# Fat
# Protein
# Fiber
# Sugar
