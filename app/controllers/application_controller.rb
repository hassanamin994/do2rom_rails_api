class ApplicationController < ActionController::API
	require 'carrierwave'
	include Knock::Authenticable
		unless controller_name == 'api'
			before_action :authenticate_user
		end 
end
