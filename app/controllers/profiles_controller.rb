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

  def profiles_params
    params.require(:profile).permit(:essentials)
  end

  private :profiles_params
end
