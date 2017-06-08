class ApplicationController < ActionController::API
	require 'carrierwave'
	include Knock::Authenticable
	before_action do |controller|
		puts controller_name+'/************'+action_name
		unless controller_name == 'api'
			puts "*******"
			authenticate_user
		end 
	end
	 
	
end
