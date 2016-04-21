class InventoriesController < ApplicationController
  
  before_filter :authorize
  
  def create
    @user = User.find(session[:user_id])
    @user.inventory = Inventories.create

  def add_items
    @user = User.find(session[:user_id])
    @grocery_list = @user.grocery_list
    @inventory = @user.inventory
    @grocery_list.items.each do |item|
      if not item.amount.zero?
        inventory_item = @user.inventory.items.find_by_name(item.name)
        if inventory_item.empty?
          @inventory.items.create(:name => item.name, :amount => item.amount)
        else
          Item.update(item.id, :amount => (inventory_item.amount + item.amount))
        end
      end
    end
    redirect_to grocery_list_path
  end

  def show
    @user = User.find(session[:user_id])
    @itemable, @inventory = @user.inventory
  end

  def inventory_params
    params.require(:inventories).permit(:items)
  end

end
