class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods.order(created_at: :desc)
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
      else
        format.html { render :new, alert: 'Food could not be created' }
      end
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    if @food.destroy
      redirect_to foods_path, notice: 'Food was deleted successfully'
    else
      flash.now[:alert] = @food.errors.full_messages.first if @food.errors.any?
      render :index, status: 400
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measuring_unit, :quantity, :price)
  end
end
