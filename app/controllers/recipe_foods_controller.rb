class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_recipe
  before_action :authorize_recipe_access

  def index
    @recipe_food = RecipeFood.new
    @recipe_id = params[:recipe_id]
  end

  def show
    @recipe_food = @recipe.recipe_foods
  end

  def new
    @foods = current_user.foods.all
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find_by_id(params[:id])
    @recipe_food.quantity = recipe_food_params[:quantity]
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Food was updated successfully'
    else
      flash.now[:alert] = @recipe_food.errors.full_messages.first if @recipe_food.errors.any?
      render :edit, status: 400
    end
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Food created successfully'
    else
      flash.now[:alert] = @recipe_food.errors.full_messages.first if @recipe_food.errors.any?
      render :new, status: 400
    end
  end

  def destroy
    if can? :edit, @recipe
      @recipe_food = RecipeFood.find(params[:id])
      if @recipe_food.destroy
        redirect_to recipe_path(@recipe), notice: 'Recipe Food was deleted successfully'
      else
        flash.now[:alert] = @recipe_food.errors.full_messages.first if @recipe_food.errors.any?
        render :new, status: 400
      end
    else
      flash[:alert] = 'ized'
      redirect_to recipe_path(id: @recipe.id)
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end

  def authorize_recipe_access
    return unless @recipe.present? && current_user != @recipe.user

    flash[:alert] = 'You are not authorized to modify this recipe'
    redirect_to recipe_path(id: @recipe.id)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
