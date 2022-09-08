class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
    @recipes = current_user.recipes
  end

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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :meal_type, recipe_food_items_attributes: [food_item: []])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
