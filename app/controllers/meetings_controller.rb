class MeetingsController < ApplicationController
	include MeetingsHelper
	before_action :authenticate_user!
	before_action :admin_only! , except: [:index, :show]

	def index
		@meetings = Meeting.where("date_for > ?", Date.yesterday).sort_by {|meeting| meeting.date_for}
		@past_meetings = Meeting.where("date_for < ?", Date.today).sort_by {|meeting| meeting.date_for}
	end

	def show
		@meeting = Meeting.find(params[:id])
		@relationship = Relationship.new
		@already_signed_in = nil
		if Relationship.where(user_id: current_user.id , meeting_id: @meeting.id ).count == 0
			@already_signed_in = false
		else
			@already_signed_in = true
		end
	end

	def edit
		@dates = Meeting.new.dates
		@meeting = Meeting.find(params[:id])
	end

	def create
		@meeting = current_user.meetings.build(meeting_params)
		if @meeting.save
			redirect_to meeting_path(@meeting) , :notice => "Meeting created!"
		else
			redirect_to new_meeting_path , :alert => "Please try again!"
		end
	end

	def new
		@dates = Meeting.new.dates
		@meeting = Meeting.new
	end

	def update
		@meeting = Meeting.find(params[:id])
		if @meeting.update_attributes(meeting_params)
			redirect_to meeting_path(@meeting), :notice => "Meeting updated!"
		else
			redirect_to(:back)
		end
	end

	def destroy
		@meeting.destroy
		redirect_to root_path
	end

	def activate
		@meeting = Meeting.find(params[:id])
		@meeting.active = true
		@meeting.save
		redirect_to meeting_path(@meeting)
	end

	def deactivate
		@meeting = Meeting.find(params[:id])
		@meeting.active = false
		@meeting.save
		redirect_to meeting_path(@meeting)
	end

	def stats
		@meeting = Meeting.find(params[:id])
		@users_hash = get_attendance(@meeting)
		@users_hash.first
	end

	private

	def meeting_params
    params.require(:meeting).permit(:title, :description , :date_for)
  end

end