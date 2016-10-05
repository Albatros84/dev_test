class PrivateApi::V1::PrivateApiController < PrivateApi::V1::BaseController
  before_filter :restrict_access

  def locations
    c=Country.where(country_code: params[:country_code]).first
    render json: c.location_groups.where(panel_provider_id: c.panel_provider_id).first.locations.to_json
  end  

  def target_groups
    c=Country.where(country_code: params[:country_code]).first
    render json: c.target_groups.where(panel_provider_id: c.panel_provider_id).to_json
  end


  def evaluate_target
    c=Country.where(country_code: params[:country_code]).first

    price = case c.panel_provider_id
       when 1 then PanelProvider.panel1_price
       when 2 then PanelProvider.panel2_price
       when 3 then PanelProvider.panel3_price
       else "Unknown"
    end

    render json: price.to_json
  end


private

  def evaluate_params
    params.permit(:country_code, :target_group_id, :locations, :access_toke)
  end

def restrict_access
  unless ApiKey.exists?(access_token: params[:access_token].to_s)
    redirect_to root_url
  end
end

end