class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :destroy]


  def index
    @recipes = current_user.recipes

    # if params[:meal_type] == "Breakfast"
    #   @recipe.meal_type = "Breakfast"
    # elsif params[:meal_type] == "Lunch"
    #   @recipe.meal_type = "Lunch"
    # else
    #   @recipe.meal_type = "Dinner"
    # end

    # @recipes_meal_types = @recipes.group_by {|recipe| recipe.meal_type}
    # @meal_type = @recipes.meal_type
    #  Recipe.joins()
    # @recipes_meal_types = @recipes.each do |recipe|
    #   @recipes_meal_types = recipe.meal_type
    #     @recipe_name = @recipes.each do |recipe_type|
    #       @recipe_name = recipe_type.name
    #     end
    # end




    # @recent_report_food_item = ReportFoodItem.joins(:report).where(report: { user_id: current_user.id }).order(created_at: :desc).limit(10)

      # @recent_food_items = FoodItem.joins(report_food_items: :report).where(report: { user_id: current_user.id, meal_type: @report.meal_type }).distinct.order(created_at: :desc).limit(10)


  end




  # report_food_item_params[:food_item_id].each do |report_food_item|
  #   @report_food_item = ReportFoodItem.new(food_item_id: report_food_item, meal_type: @report.meal_type)
  #   @report_food_item.report = @report
  #   @report_food_item.save!
  # end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      params[:recipe][:recipe_food_item_ids].reject(&:blank?).each do |food_item_id|
        @recipe_food_item = RecipeFoodItem.new(recipe: @recipe, food_item_id: food_item_id)
        @recipe_food_item.save
      end
      redirect_to recipe_path(@recipe.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :meal_type, recipe_food_items_attributes: [food_item: []])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
