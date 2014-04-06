class LocationsController < ApplicationController

  def create
    @location = Location.new(location_params)
    @info = Info.find_by(params[:info_id])
    unless Location.first.blank?
      Location.first.delete
    end

    if @location.save
      redirect_to @info
    else
      redirect_to @info
    end
  end

  private

  def location_params
    params.require(:location).permit(:region)
  end

end
