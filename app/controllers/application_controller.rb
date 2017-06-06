class ApplicationController < ActionController::API
	require 'carrierwave'
	include Knock::Authenticable
	before_action :authenticate_user
end
