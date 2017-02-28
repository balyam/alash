class ClansController < ApplicationController
  before_action :set_clan, only: [:show, :edit, :update, :destroy]
  
  def index
    @clans = Clan.all
  end

  def show; end

  def new
    @clan = Clan.new
    @tribes = Tribe.all
  end

  def edit
    @tribes = Tribe.all
  end

  def create
    @clan = Clan.new(clan_params)

    if @clan.save
      redirect_to @clan
      flash[:success] = 'Clan was successfully created.'
    # format.json { render :show, status: :created, location: @clan }
    else
      flash[:danger] = flash[:danger].to_a.concat(@clan.errors.full_messages)
      redirect_to new_clan_path
      # format.json { render json: @clan.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @clan.update(clan_params)
      redirect_to @clan
      flash[:success] = 'Clan was successfully updated.'
      # format.json { render :show, status: :ok, location: @clan }
    else
      render :edit
      # format.json { render json: @clan.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @clan.destroy
    redirect_to clans_url
    flash[:success] = 'Clan was successfully destroyed.'
      # format.json { head :no_content }
    end

  def update_tribes
    # update list of tribe based on selected union
    union = Union.find(params[:union_id])
    @tribes = union.tribes.map { |a| [a.name, a.id] }
    end

  def update_clans
    # updates clans based on tribe selected
    Tribe.find(params[:tribe_id])    
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_clan
    @clan = Clan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def clan_params
    params.require(:clan).permit(:name, :text, :tribe)
  end
end
