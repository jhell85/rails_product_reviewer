class ApplicationController < ActionController::Base
  helper_method :is_admin?
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [:index]
  
end
