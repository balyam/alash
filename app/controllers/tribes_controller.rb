class TribesController < ApplicationController
  before_action :set_tribe, only: [:show, :edit, :update, :destroy]
  
  def index
    @tribes = Tribe.all
  end

  def show; end

  def new
    @tribe = Tribe.new
  end

  def edit; end

  def create
    @tribe = Tribe.new(tribe_params)

    if @tribe.save
      redirect_to @tribe
      flash[:success] = 'Tribe was successfully created.'
      # format.json { render :show, status: :created, location: @tribe }
    else
      flash[:danger] = flash[:danger].to_a.concat(@tribe.errors.full_messages)
      redirect_to new_tribe_path
      # format.json { render json: @tribe.errors, status: :unprocessable_entity }
    end
    end

  def update
    if @tribe.update(tribe_params)
      redirect_to @tribe
      flash[:success] = 'Tribe was successfully updated.'
    # format.json { render :show, status: :ok, location: @tribe }
    else
      render :edit
      # format.json { render json: @tribe.errors, status: :unprocessable_entity }
    end
    end

  def destroy
    if @tribe.destroy

      flash[:info] = 'Tribe was successfully destroyed.'

    else
      flash[:danger] = 'Ooopps! Something gone wrong!'
    end

    redirect_to tribes_url
    end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tribe
    @tribe = Tribe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tribe_params
    params.require(:tribe).permit(:name, :namecyr, :text, :union, :uran)
  end
end
