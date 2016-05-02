class SessionsController < ApplicationController
  layout "login"

  def new
  end

  def create
    @user = User.find_by user_name: params[:session][:user_name]
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.profile.budget.budget_period_date < Date.today
        @user.profile.budget.update(start: Date.today, budget_used: 0.0)
      end
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
