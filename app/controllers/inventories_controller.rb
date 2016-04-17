class InventoriesController < ApplicationController
  
  before_filter :authorize

  def add_items
    @user = User.find(session[:user_id])
    @inventory = []
    @user.grocery_list.items.each do |x|
      if x.list_amount != 0.0
        Item.update(x.id, :inventory_amount => (x.inventory_amount + x.list_amount), :list_amount => 0.0)
      end
    end
    redirect_to grocery_list_path
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
