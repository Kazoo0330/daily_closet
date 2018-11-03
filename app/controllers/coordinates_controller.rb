coordinates_controller.rb
class CoordinatesController < ApplicationController

  def index
    @coordinates  = Coordinate.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @coordinate = Coordinate.new(coordinate_params)
    else
      @coordinate = Coordinate.new
    end
  end

  def confirm
    render :new if @coordinate.invalid?
  end

  def create
    if @coordinate.save
      redirect_to coordinates_path, notice: "Coordinate successfully shared!"
    else
      render 'new'
    end
  end

  def show
    @coordinate = Coordinate.find(params[:id])
  end

  def edit; end

  def update
    if @coordinate.update(coordinate_params)
      redirect_to coordinate_path, notice: "Coordinate successfullyedited!"
    else
      render 'edit'
    end
  end

  def destroy
    @coordinate.destroy
    redirect_to coordinates_path, notice: "Coordinate successfully deleted."
  end

  private

  def coordinate_params
    params.require(:coordinate).permit %i[title content image image_cache]
  end
end
