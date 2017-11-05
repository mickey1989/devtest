class EvaluateTargetController < BaseController
    before_filter :authenticate_user!
  
    def create
        create_params
        country = Country.where(country_code: params[:country_code]).first
        if country
          panel_provider_id = country.panel_provider_id
          panel_provider_price_service = PanelProviderPriceService.new()

          return render json: panel_provider_price_service.calculate_panel_provider_price(panel_provider_id)
        else
          return not_found!
        end
    end

    def create_params
        params.require(:country_code)
        params.require(:target_group)
        params.require(:locations)
      end
end