class LocationsController < BaseController
  before_filter :authenticate_user!

  # GET /locations/1
  # GET /locations/1.json
  def show
    get_locations
  end

  private
  def get_locations
    country_code = params[:id]
    country = Country.where(country_code: country_code).first
    if country
      locations = []
      country.location_groups.each do |location_group|
        locations.concat location_group.locations
      end
      return render json: locations
    else
      return not_found!
    end
  end

end