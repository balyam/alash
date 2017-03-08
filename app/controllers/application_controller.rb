class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_unions_for_menu
  protect_from_forgery with: :exception
  
  #select Union's titles for menu from DB
  private 
  def set_unions_for_menu
    @unions = Union.all
  end

end
