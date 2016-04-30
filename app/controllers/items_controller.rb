class ItemsController < ApplicationController

  before_filter :authorize

  def create
    @itemable = find_itemable
    Item.define_units item_params[:unit]
    @item = @itemable.items.create(item_params)
    redirect_to '/grocery_list'
  end

  def show
    @itemable = find_itemable
    @item = @itemable.items.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @itemable = find_itemable

    updates = item_params
    to_update = {}
    updates.each  do |item|
      h1 = @itemable.items.find(item[:item_id])
      puts h1.inspect
      if h1[:amount] != item[:amount].to_f
        to_update.merge!(item[:item_id] => { :amount => item[:amount]})
      end
    end
    
    Item.update(to_update.keys, to_update.values)
    
    redirect_to :back
  end

  def destroy
    @itemable = find_itemable
    @item = @itemable.items.find(params[:id])
    @item.destroy
    redirect_to @itemable
  end

  def delete_all
    @itemable = find_itemable
    @itemable.items.delete_all
    redirect_to @itemable
  end

  def item_params
    params.permit(:name, :amount, :unit, :id, :item => [:name, :amount, :unit, :item_id]).require(:item)
  end

  def find_itemable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def compare_units 

  end
  
  private :item_params, :find_itemable
end
