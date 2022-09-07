class RecipeFoodItemsController < ApplicationController
  # before_action :set_recipe_food_item, only: :destroy
  # before_action :set_recipe, only: [:new, :create]

  def new
    @recipe_food_item = RecipeFoodItem.new
  end

  def create
    @recipe_food_item = RecipeFoodItem.new(recipe_food_item_params)
    @recipe_food_item.recipe = @recipe
    if @recipe_food_item.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipes_path
    end
  end

  private

  def recipe_food_item_params
    params.require(:recipe_food_item).permit(:name, :recipe_id)
  end

  def set_recipe_food_item
    @recipe_food_items = RecipeFoodItem.find(params[:id])
  end

  # def set_recipe
  #   @recipe = Recipe.find(params[:Recipe_id])
  # end
end
