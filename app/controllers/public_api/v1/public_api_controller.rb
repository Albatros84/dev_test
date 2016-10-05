require 'rack/throttle'

class PublicApi::V1::PublicApiController < ApplicationController
  use Rack::Throttle::Interval, :min => 3.0
  
  
  def locations
    c=Country.where(country_code: params[:country_code]).first
    puts c.location_groups.where(panel_provider_id: c.panel_provider_id).first.locations
    locations=c.location_groups.where(panel_provider_id: c.panel_provider_id).first.locations
    render json: locations.map { |loc| loc.as_json(only: [:id, :name, :external_id]) }
  end 


  def target_groups
    c=Country.where(country_code: params[:country_code]).first
    target_groups=c.target_groups.where(panel_provider_id: c.panel_provider_id)
    render json: target_groups.map { |tg| tg.as_json(only: [:id, :name, :external_id, :parent_id, :panel_provider_id ]) }
  end


end