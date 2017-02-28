class PersonsController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy, :edit]

  def index
    @persons = Person.all
  end

  def show; end

  def new
    @person = Person.new
    @tribes = Tribe.all
    @clans = Clan.all
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
      flash[:success] = 'Person was created!'
    else
      redirect_to new_person_path
      flash[:danger] = 'Something wrong'
    end
  end

  def edit; end

  def update
    @person.update(person_params)
    redirect_to person_path
  end

  def destroy
    @person.destroy
    redirect_to persons_path
    flash[:success] = "#{@person.name} was successfully destroyed."
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:name, :status, :text, :sex, :generation, :latname, :clantitle, :tribetitle, :parent)
  end
end
