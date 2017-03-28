class WithinsController < ApplicationController
  before_action :set_clan, only: %i(new create)

  def index; end

  def new
    @tribes = Tribe.all
  end

  def create    
    tribe = Tribe.where(id: params[:clan][:tribe]).first
    within = Within.create(from_node: @clan, to_node: tribe)

    if within.save
      flash[:success] = "#{within.from_node.name} part of tribe #{within.to_node.name}"
    else
      flash[:danger] = flash[:danger].to_a.concat(within.errors.full_messages)
    end
    redirect_to clan_path(@clan)
  end

  def show
    @clan = Clan.where(id: params[:clan_id])
  end

  def update; end

  def destroy
  	within = Within.find(params[:clan_id])
    if within.destroy
      flash[:success] = 'Relation was successfully destroyed.'
    else
      flash[:danger] = flash[:danger].to_a.concat(within.errors.full_messages)
      end

    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_clan
    @clan = Clan.find(params[:clan_id])
  end
end
