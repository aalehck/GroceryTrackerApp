require 'unirest'
require 'json'

class RecipesController < ApplicationController

  before_filter :authorize
  
  def index
    @user = User.find(session[:user_id])
    @recipes = @user.recipes
  end

  def new
    @user = User.find(session[:user_id])
    @recipe = Recipe.new
  end
  
  def create
  end
  
  def show
    @user = User.find(session[:user_id])
    @recipes = @user.recipes.find(params[:id])

  end

  def destroy
  end

  def recipe_params
    params
#.require(:recipe).permit(:cuisine, :diet, :number, :offset, :query)
  end

  def search
    search_params = recipe_params

    uri = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?cuisine=#{search_params[:cuisine]}&diet=#{search_params[:diet]}&number=#{search_params[:number]}&offset=#{search_params[:offset]}&query=#{search_params[:query]}"
    
    @resp = Unirest.get uri, headers:{ "X-Mashape-Key" => "o0PEFR8zTDmshlk3dBI4YmNg7O2ep12IyWrjsng7WgOycYs0bF"}
        
  end

  def search_result
    params = recipe_params

    uri = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:recipe_id]}/information?includeNutrition=false"

    response = Unirest.get uri,
    headers:{
      "X-Mashape-Key" => "o0PEFR8zTDmshlk3dBI4YmNg7O2ep12IyWrjsng7WgOycYs0bF"
    }

    @body = response.body
  end

  private :recipe_params
end
