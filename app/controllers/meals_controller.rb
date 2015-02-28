class MealsController < ApplicationController

  def index
    @meals = @current_user.meals
  end

  def create
    meal = @current_user.meals.create(meal_params)
    redirect_to meal
  end

  def new
    @meal = Meal.new
  end

  def show
    @meal = Meal.find params[:id]
  end

  # def complete
  #   @meal = Meal.find params[:meal_id]
  # end

  def edit
    @meal = Meal.find params[:id]
  end

  def update
    meal = Meal.find params[:id]
    meal.update meal_params
    redirect_to meal_path  
  end



  def destroy
    meal = Meal.find params[:id]
    meal.destroy
    redirect_to meals_path
  end

  private 
  def meal_params
    params.require(:meal).permit(:meal_time, :user_id)
  end

end
