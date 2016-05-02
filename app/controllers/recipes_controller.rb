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
    @user = User.find(session[:user_id])

    body  = JSON.parse params[:information].gsub("=>", ":")

    body['extendedIngredients'].each do |i|
      # Awful hack because I'm not sure how else handle units = '', which REALLY breaks
      # the units gem being used
      if i['unit'].strip.empty?
        i['unit'] = " "
      end
      ingredient = @user.grocery_list.find_compatible_item(i['name'], i['unit'])
      if ingredient.nil?
        ingredient = @user.grocery_list.items.create(name: i['name'].downcase, amount: i['amount'], unit: i['unit'])
      else
        result_amount = Item.make_proper_units("#{ingredient.amount} #{ingredient.unit}", "#{i['amount']} #{i['unit']}")
        if result_amount.nil?
           ingredient = @user.grocery_list.items.create(name: i['name'].downcase, amount: i['amount'], unit: i['unit'])
        else 
          Item.update(ingredient.id,:amount => result_amount)
        end
      end
    end

    @recipe = @user.recipes.create(title: body['title'], time: body['readyInMinutes'], information: body)

    redirect_to recipes_path
  end
  
  def show
    @user = User.find(session[:user_id])
    @recipe = @user.recipes.find(params[:id])
  end

  def destroy
    @user = User.find(session[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def recipe_params
    params
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
    #private :recipe_params
    @message = "Cost information below:"
    @getCost = Array.new
    @body['extendedIngredients'].each do |ingredient|
      if !ingredient['originalString'].empty?
        @getCost.push(ingredient['originalString'])
      else
        @getCost.push(ingredient['name'] + ingredient['amount'] + ingredient['unit'])
      end
      
    end

  end
end
