class BudgetController < ApplicationController
	def index
		@message = "Cost information below:"
		
		@getPrice = "9000000 ounces cheddar cheese"
		@getPrice2 = "1 pound ground beef"
		@getPrice3 = "24 ounces broccoli"		
		
=begin 
			@response = Unirest.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/visualizePriceEstimator",
			  headers:{
				"X-Mashape-Key" => "ihSgtNZGjqmshzEVUpnHfrb4JBXip1c7Op6jsn5qKekiaGMAGp",
				"Content-Type" => "application/x-www-form-urlencoded"
			  },
			  parameters:{
				"defaultCss" => "checked",
				"ingredientList" => "3 oz flour",
				"mode" => 2,
				"servings" => 2
			  }
=end
		  
	end
end
