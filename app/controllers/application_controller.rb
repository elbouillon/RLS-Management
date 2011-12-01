class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  layout :layout

  private
  
  def layout
    # only turn it off for login pages:
    #is_a?(Devise::SessionsController) ? "signin" : "application"
    # or turn layout off for every devise controller:
    devise_controller? ? "signin" : "application"
  end

end
