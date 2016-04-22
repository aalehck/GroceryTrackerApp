class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "default"

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def make_itemable_id
    if not @itemable.nil?
       return "#{ActiveModel::Naming.singular_route_key(@itemable)}_id"
    end
  end

  helper_method :current_user, :make_itemable_id

  def authorize
    redirect_to '/login' unless current_user
  end
end
