class ReportFoodItemsController < ApplicationController
  # before_action :set_foor_items, only: [:create, :new]

  def show
    @food_items = ReportFoodItem.food_item.name
  end

  def new
    @report_food_item = ReportFoodItem.new
    @food_items = FoodItem.all
    @report = Report.find(params[:report_id])
    @recent_report_food_item = ReportFoodItem.joins(:report).where(report: { user_id: current_user.id }).order(created_at: :desc).limit(10)
  end


  def create
    @reports = Report.all
    @report = Report.find(params[:report_id])
    @recent_report_food_item = ReportFoodItem.joins(:report).where(report: { user_id: current_user.id }).order(created_at: :desc).limit(10)

    params[:report_food_item][:food_item_id].reject!(&:blank?)

    report_food_item_params[:food_item_id].each do |report_food_item|
      @report_food_item = ReportFoodItem.new(food_item_id: report_food_item)
      @report_food_item.report = @report
      @report_food_item.save!
    end
    redirect_to report_path(@report)
  end

  private

  def report_food_item_params
    params.require(:report_food_item).permit(food_item_id: [])
  end

  # def set_foor_items
  #   @food_item = FoodItem.find(params[:id])
  # end
end
