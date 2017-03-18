class UnionsController < ApplicationController
  before_action :set_union, only: [:show, :edit, :update, :destroy]

  def index
    # See application_controller
  end

  def show; end

  def edit; end

  def update
    @union.update(union_params)
    redirect_to union_path
  end

  def new
    @union = Union.new
  end

  def create
    union = Union.new(union_params)
    if union.save
      flash[:notice] = 'Union was successfully created.'
      redirect_to unions_path
    else
      flash[:danger] = flash[:danger].to_a.concat(union.errors.full_messages)
      redirect_to unions_path
     end
  end

  def destroy
    if @union.destroy
      flash[:notice] = 'Union was deleted'
    else
      flash[:danger] = flash[:danger].to_a.concat(@union.errors.full_messages)
    end    
    redirect_to unions_path
  end

  private

  def set_union
    @union = Union.find(params[:id])
  end

  def union_params
    params.require(:union).permit(:name, :namecyr, :describe)
  end
end
