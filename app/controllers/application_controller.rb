class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter -> { flash.now[:notice] = flash[:notice].html_safe if flash[:html_safe] && flash[:notice] }

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end
end
