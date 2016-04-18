class ItemsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @items = @user.grocery_list.items.create(item_params)
    redirect_to '/grocery_list'
  end

  def show
    @user = User.find(session[:user_id])
    @item = @user.grocery_list.items.find(params[:id])
  end

  def destroy
    @user = User.find(session[:user_id])
    @item = @user.grocery_list.items.find(params[:id])
    @item.destroy
    redirect_to grocery_list_path
  end

  def item_params
    params.require(:item).permit(:name, :list_amount)
  end
  
  private :item_params
end
