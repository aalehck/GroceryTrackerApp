class ItemsController < ApplicationController

  before_filter :authorize

  def create
    @itemable = find_itemable
    Item.proper_units? item_params[:unit]
    @item = @itemable.items.create(item_params)
    redirect_to '/grocery_list'
  end

  def show
    @itemable = find_itemable
    @item = @itemable.items.find(params[:id])
  end

  def destroy
    @itemable = find_itemable
    @item = @itemable.items.find(params[:id])
    @item.destroy
    redirect_to @itemable
  end

  def item_params
    params.require(:item).permit(:name, :amount, :unit, :id)
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
