class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show]

  def index
    @food_items = FoodItem.all
  end

  def show

  end

  private

  def set_listing
    @food_item = FoodItem.find(params[:id])
  end
end
