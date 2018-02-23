class PersonsController < ApplicationController
  before_action :set_person, only: %i(show update destroy edit addson)

  def index
    @persons = Person.all.order(:name).limit(20)
  end

  def show
    # List of seven ancestors of person
    @ancestors = @person.ancestor(rel_length: 1..7)
  end

  def new
    @person = Person.new
    @tribes = Tribe.all
    @clans = Clan.all.order(:name)
  end

  def create
    person = Person.new(person_params)

    if person.save
      flash[:success] = 'Person was created!'
      redirect_to person
    else
      flash[:danger] = flash[:danger].to_a.concat(person.errors.full_messages)
      redirect_to new_person_path
    end
  end

  def update_clans
    # updates clans based on tribe selected
    tribe = Tribe.find(params[:tribe_id])
    @clans = tribe.clans.order(:name).map { |a| [a.name, a.id] }
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

  def addson
    @son = Person.new
    render 'addson'
  end  

  
  private

  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:name, :status, :text, :sex, :myclan,
                                   :generation, :translitname, :ancestor, :seeds)
  end
end
