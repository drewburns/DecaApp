class UsersController < ApplicationController
	include UsersHelper
	before_action :authenticate_user!
	def index
		@users = User.all.sort
		if current_user.admin == true
			@email_list = email_list(@users)
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def stats
		@user = User.find(params[:id])
		@meetings_hash = get_attendance(@user)
		@meetings_hash.first
	end

end