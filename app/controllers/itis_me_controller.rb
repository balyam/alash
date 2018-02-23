class ItisMeController < ApplicationController
  before_action :set_person, only: %i(create destroy)
  before_action :check_itsme, only: %i(create)

  def new; end

  def create
    itisme = ItisMe.create_itisme(current_user, @person)
    if itisme.save
      flash[:success] = "#{itisme.from_node.id} is person #{itisme.to_node.name}"
    else
      flash[:danger] = flash[:danger].to_a.concat(itisme.errors.full_messages)
    end
    redirect_to @person
  end

  def destroy
    itsme = ItisMe.find(params[:id])
    if itsme.destroy
      flash[:info] = 'Relation from user to person in Shejire was destroyed.'
    else
      flash[:danger] = flash[:danger].to_a.concat(itsme.errors.full_messages)
    end

    redirect_to person_path(params[:person_id])
  end

  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def check_itsme
    return unless current_user.itisme.present?
    flash[:error] = 'Oopps! You have relation with another Person. Check your profile'
    redirect_to person_path(params[:person_id])
  end
end
