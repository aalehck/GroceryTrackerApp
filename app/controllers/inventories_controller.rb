class InventoriesController < ApplicationController
  
  before_filter :authorize

  def create
    @user = User.find(session[:user_id])
    @inventory = []
    @user.grocery_list.items.each do |x|
    
  end

  def show
    @user = User.find(session[:user_id])
    @inventory = []
    @user.grocery_list.items.each do |x|
      puts x.inventory_amount
      if x.inventory_amount != 0.0
        @inventory.append(x)
      end
    end
  end

  def inventory_params
    params.require(:inventories).permit(:items)
  end

end
