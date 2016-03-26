class ItemsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @items = @user.grocery_list.items.create(item_params)
    redirect_to '/grocery_list'
  end

  def destroy
    @user = User.find(session[:user_id])
    @items = @user.grocery_lists.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
  
  private :item_params
end
