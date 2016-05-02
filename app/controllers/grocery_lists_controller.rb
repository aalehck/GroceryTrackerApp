class GroceryListsController < ApplicationController
  
  before_filter :authorize

  def create
    @user =  User.find(session[:user_id])
    @user.grocery_list = Grocery_lists.create
  end

  def show
    @user = User.find(session[:user_id])
    @itemable, @grocery_list = @user.grocery_list
    @itemable_id = make_itemable_id
    @budget = @user.profile.budget
    @item = Item.new
    
  end

  def grocery_lists_params
    params.require(:grocery_lists).permit(:items, :id, items_attributes: [:id])
  end

  private :grocery_lists_params
end
