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
		redirect_to root_url unless current_user == @user or current_user.admin == true
		@meetings_hash = get_attendance(@user)
		@meetings_hash.first
	end

end