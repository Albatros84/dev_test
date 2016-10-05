class PublicApi::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
end
