class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_unions_for_menu, :set_unions
  before_action :authenticate_user!, except: %i(index show)
  protect_from_forgery with: :exception

  # update list of tribe based on selected union
  def update_tribes
    union = Union.find(params[:union_id])
    @tribes = union.tribes.order(:name).map { |a| [a.name, a.id] }
  end

  private

  # select Union's titles for menu from DB
  def set_unions_for_menu
    @menu ||= Union.all.pluck(:name, :menu, :id)
  end

  def set_unions
    @unions = Union.all
  end
end
