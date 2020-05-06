class RecipesController < ApplicationController
  # before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, :with => :recipe_not_found

  def index
    @recipes = Recipe.includes(:ingredients).all
    render "/layouts/recipes/index.json.jbuilder"
  end

  def show
    @recipe = Recipe.includes(:ingredients).find(params[:id])
    render "/layouts/recipes/show.json.jbuilder"
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.validate
      @recipe.save
      render "/layouts/recipes/show.json.jbuilder", status: :created
    else
      render "/layouts/recipes/show.json.jbuilder", status: 400
    end
  end

  def update
    @recipe = Recipe.includes(:ingredients).find(params[:id])
    if @recipe.update(recipe_params)
      render "/layouts/recipes/show.json.jbuilder", status: 201
    else
      render json: { message: "Failed to Update", error: @recipe.errors }, status: 400
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      render json: { message: "Success" },status: 204
    else
      render json: { message: "Faild to Delete", error: @recipe.errors }, status: 400
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :tips, :directions, :ingredients, :id)
  end

  def recipe_not_found
    render json: {message: "Recipe Not Found", status: 400}
  end
end
