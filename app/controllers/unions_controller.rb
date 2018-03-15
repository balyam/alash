class UnionsController < ApplicationController
  before_action :set_union, only: %i(show edit update destroy)

  def index
    # See application_controller
    # @unions = Union.all
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
    else
      flash[:danger] = flash[:danger].to_a.concat(union.errors.full_messages)
    end
    redirect_to unions_path
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
    params.require(:union).permit(:name, :translitname, :describe, :menu)
  end
end
