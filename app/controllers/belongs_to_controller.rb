class BelongsToController < ApplicationController
  before_action :set_person, only: [:show, :new, :create]

  def show
    @person = Person.where(id: params[:person_id])
  end

  def new    
    @tribes = Tribe.all
    @clans = Clan.all
  end

  def create    
    clan = Clan.find(params[:person][:myclan])
    belongs = BelongsTo.create(from_node: @person, to_node: clan)

    if belongs.save
      flash[:success] = "#{belongs.from_node.name} belongs to clan #{belongs.to_node.name}"
    else
      flash[:danger] = flash[:danger].to_a.concat(belongs.errors.full_messages)
    end

    redirect_to person_path(params[:person_id])
  end

  def destroy
    @son = BelongsTo.find(params[:id])
    if @son.destroy
      flash[:info] = 'Relation was successfully destroyed.'
    else
      flash[:danger] = flash[:danger].to_a.concat(@son.errors.full_messages)
    end

    redirect_to person_path(params[:person_id])
  end

  def update; end

  private

  def set_person
    @person = Person.where(id: params[:person_id]).first
  end
end
