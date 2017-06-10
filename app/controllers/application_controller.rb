class ApplicationController < ActionController::API
	require 'carrierwave'
	include Knock::Authenticable
end
