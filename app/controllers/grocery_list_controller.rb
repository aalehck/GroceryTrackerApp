class GroceryListController < ApplicationController
  
  before_filter :authorize

  def create
    @user = User.find(params[:user_id])
    @grocery_list = @user.grocery_list.create(grocery_list)
  end

  def show
    @user = User.find(params[:user_id])
    @grocery_list = @user.grocery_list
  end

  def grocery_list_params
    params.require(:grocery_list).permit(:inventory)
  end

  private :grocery_list_params
end
