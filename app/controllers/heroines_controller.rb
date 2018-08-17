class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    find_heroine
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.errors
      render :new
    else
      redirect_to heroine_path(@heroine)
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end
end
