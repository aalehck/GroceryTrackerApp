class UsersController < ApplicationController
  layout "login"
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.grocery_list = GroceryList.create
      @user.inventory = Inventory.create
      @user.profile = Profile.create
      @user.profile.budget = Budget.create
      redirect_to '/profile'
    else
      redirect_to '/signup'
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, grocery_list_attributes: [:id])
  end

  private :user_params
end
