class ApplicationController < ActionController::API
	require 'carrierwave'
	include Knock::Authenticable
	#before_action do |controller|
	#	unless controller_name == 'api'
	#		authenticate_user
	#	end 
	#end
	 
	
end
