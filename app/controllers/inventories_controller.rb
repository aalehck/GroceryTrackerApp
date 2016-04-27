class InventoriesController < ApplicationController
  
  before_filter :authorize
  
  def create
    @user = User.find(session[:user_id])
    @user.inventory = Inventories.create
  end

  def add_items
    @user = User.find(session[:user_id])
    @grocery_list = @user.grocery_list
    @inventory = @user.inventory
    @grocery_list.items.each do |item|
      if not item.amount.zero?
        inventory_item = @user.inventory.find_compatible_item(item.name, item.unit)
        if inventory_item.nil?
          @inventory.items.create(:name => item.name, :amount => item.amount, unit: item.unit)
        else
          amount = Item.make_proper_units("#{inventory_item.amount} #{inventory_item.unit}","#{item.amount} #{item.unit}")
          if amount.nil?
            @inventory.items.create(:name => item.name, :amount => item.amount, unit: item.unit)
          else
            Item.update(inventory_item.id, :amount => amount)
          end
        end
      end
      item.destroy
    end
    redirect_to grocery_list_path
  end

  def show
    @user = User.find(session[:user_id])
    @itemable, @inventory = @user.inventory
    @itemable_id = make_itemable_id
    @budget = @user.profile.budget
    @item = Item.new
  end

  def inventory_params
    params.require(:inventories).permit(:items)
  end

end