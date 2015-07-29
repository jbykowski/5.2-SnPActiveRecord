class WelcomeController < ApplicationController
	def index
		@post_id = params[:id]
	end
end