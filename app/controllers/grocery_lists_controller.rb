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
	@low_inventory_array = Array.new
	@user.grocery_list.items.each do |item|
      if item.amount < 1.0
		@low_inventory_array.push(item.name)		
	  end
	end
	if @low_inventory_array.size > 0.0
        GroceryListMailer.low_inventory_email(@low_inventory_array, @user).deliver_now
    end
  end
  
  def gmail
     @gmail = params[:textGmail]
   end

  def grocery_lists_params
    params.require(:grocery_lists).permit(:items, :id, items_attributes: [:id])
  end

  private :grocery_lists_params
end
