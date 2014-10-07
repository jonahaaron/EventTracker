class VisitorsController < ApplicationController
  before_filter :authenticate
  
  def authenticate
    unless current_user
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          username == ENV["GUEST_LOGIN"] && password == ENV["GUEST_PASSWORD"]
      end
    end
  end
end
