class ProfilesController < ApplicationController

  before_filter :authorize

  def show
    @user = User.find(session[:user_id])
    @profile = @user.profile
    @budget = @profile.budget
  end

  def update
    @user = User.find(session[:user_id])
    @user.profile.update(profiles_params)
    redirect_to profile_path
  end

  def add_essentials
    @user = User.find(session[:user_id])
    essentials = @user.profile.essentials.split(/\W+/)
    essentials.each do |e|
      exists = @user.grocery_list.items.find_by_name(e)

      if exists.nil?
        @user.grocery_list.items.create(:name => e, :amount => 0.0, :unit => " ")
      end
    end

    redirect_to profile_path
  end

  def profiles_params
    params.require(:profile).permit(:essentials)
  end

  private :profiles_params
end
