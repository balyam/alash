class PersonsController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy, :edit, :addson]

  def index
    @persons = Person.all
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
      redirect_to person
      flash[:success] = 'Person was created!'
    else
      redirect_to new_person_path
      flash[:danger] = flash[:danger].to_a.concat(person.errors.full_messages)      
    end
  end
  
  def update_tribes
    # update list of tribe based on selected union
    union = Union.find(params[:union_id])
    @tribes = union.tribes.map { |a| [a.name, a.id] }
  end
    
  def update_clans
    # updates clans based on tribe selected
    tribe = Tribe.find(params[:tribe_id])
    @clans = tribe.clans.map { |a| [a.name, a.id] }
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
                                   :generation, :latname, :parent, :ancestor, :seeds)
  end
end
