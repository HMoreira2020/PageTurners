class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include Pundit
    include Pagy::Backend
    helper_method :current_user, :logged_in?, :require_login, :admin?
    before_action :require_login
  
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private


  def logged_in? 
    current_user != nil 
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin? 
    current_user.admin? 
  end 

  def require_login
    redirect_to root_path unless logged_in? 
  end 

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
