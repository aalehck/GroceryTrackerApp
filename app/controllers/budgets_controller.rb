class BudgetsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    @user.profile.budget.update(budget_params)
    redirect_to profile_path
  end


  def budget_params
    params.require(:budget).permit(:budget_total, :budget_used, :period, :start)
  end
end
