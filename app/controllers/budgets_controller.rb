class BudgetsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    parameters = budget_params
    parameters[:start] = Date.today
    @user.profile.budget.update(parameters)
    redirect_to profile_path
  end


  def budget_params
    params.require(:budget).permit(:budget_total, :budget_used, :period, :start)
  end
end
