class VisitorsController < ApplicationController
  include ActiveSupport
  before_filter :authenticate
  
  def index
    if current_user
      @us_zones = ["Hawaii", "Alaska", "Pacific Time (US & Canada)", "Arizona", "Mountain Time (US & Canada)", "Central Time (US & Canada)", "Eastern Time (US & Canada)", "Indiana (East)"]
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
