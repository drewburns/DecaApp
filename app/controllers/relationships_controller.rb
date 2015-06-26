class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_only! , only: :destroy
	def create
		meeting = Meeting.find(params[:relationship][:meeting_id])
		if meeting.active == true and meeting.password == params[:meeting_password]
			Relationship.create(user_id: current_user.id , meeting_id: meeting.id)
			redirect_to meeting_path(meeting), :notice => "Successfully attended meeting"
		else
			redirect_to meeting_path(meeting), :alert => "Wrong password"
		end
	end

	def destroy
		@relationship = Relationship.find(params[:id])
		@relationship.destroy
		redirect(:back)
	end
end