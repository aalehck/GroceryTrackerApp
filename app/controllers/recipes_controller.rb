require 'unirest'
require 'json'

class RecipesController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
    @recipes = User.recipes
  end

  def new
    @user = User.find(session[:user_id])
    @recipe = Recipe.new
  end
  
  def create
  end
  
  def show
  end

  def destroy
  end

  def recipe_params
    params.require(:recipe)
  end

  def search
    search_params = recipe_params

    uri = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?cuisine=#{search_params[cuisine]}&diet=#{search_params[diet]}&number=#{search_params[number]}&offset=#{search_params[offset]}&query=#{search_params[query]}"
    
    @resp = Unirest.get uri
    
  end

  #private :recipe_params
end
