class VisitorsController < ApplicationController
  include ActiveSupport
  before_filter :authenticate
  
  def index
    if current_user
      @current_zone = TimeZone.us_zones.map{|k|k.to_s.sub!(/^.{12}/, '')}[current_user[:time_zone].to_i]
    end
  end
  
  def authenticate
    unless current_user
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          username == ENV["GUEST_LOGIN"] && password == ENV["GUEST_PASSWORD"]
      end
    end
  end
end
