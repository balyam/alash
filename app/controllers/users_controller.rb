class UsersController < ApplicationController
  def show
    @user = User.where(id: params[:id])
    return unless current_user.itisme.present?
    @person = Person.find(current_user.itisme.id)
    @ancestors = @person.ancestor(rel_length: 1..7)
  end
end
