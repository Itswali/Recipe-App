class FoodsController < ApplicationController
  # before_action :authenticate_user!

  def index
    # @user = current_user
    @user = User.first
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @user = User.first
    @food = @user.foods.build(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food added successfully.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food deleted successfully.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measuring_unit, :price, :quantity)
  end
end
