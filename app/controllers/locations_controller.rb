class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations/
  # GET /locations.json
  def index
    @locations = Location.all
    render json: @locations
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @country = Country.where(country_code: params[:id]).first
    if @country
      @locations = []
      @country.location_groups.each do |location_group|
        @locations.concat location_group.locations
      end
      render json: @locations
    end
  end

end