class ApiController < ApplicationController
  # Enable CORS for API calls
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers
 
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, X-Requested-With, X-Prototype-Version, Token, Authorization, Content-Type'
    headers['Access-Control-Max-Age'] = "1728000"
  end
 
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, X-Requested-With, X-Prototype-Version, Token, Authorization, Content-Type'
      headers['Access-Control-Max-Age'] = '1728000'
 
      render text: 'true', content_type: 'text/plain' ,status: :ok
    end
  end
 
  def handle_options_request
    render text: 'true', content_type: 'text/plain' ,status: :ok
  end
end
