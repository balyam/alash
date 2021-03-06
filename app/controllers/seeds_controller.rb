class SeedsController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
    @son = Seed.where(id: :id)
  end

  def new
    @persons = Person.all
    @orphans = Person.all.reject(&:ancestor)
  end

  def edit; end

  def create
    father = Person.find(params[:person][:father])
    son = Person.find(params[:person][:seeds])
    seed = Seed.create_seed(father, son)

    if seed.save
      flash[:success] = "#{seed.from_node.name} adopted #{seed.to_node.name}"
      HasFather.create_has_father(father, son)
    else
      flash[:danger] = flash[:danger].to_a.concat(seed.errors.full_messages)
    end
    redirect_to new_seed_path
  end

  def destroy
    @son = Seed.find(params[:id])
    if @son.destroy
      flash[:info] = 'Relation was successfully destroyed.'
    else
      flash[:danger] = flash[:danger].to_a.concat(@son.errors.full_messages)
    end

    redirect_to seeds_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def seed_params
    params.require(:seed).permit(:name)
  end
end
