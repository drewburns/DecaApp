module MeetingsHelper
	def find_relationship(user_id,meeting_id)
		@relationship = Relationship.where(meeting_id: meeting_id, user_id: user_id)
		if @relationship.count == 0
			@relationship = Relationship.new
		else
			@relationship.first
		end
	end

	def get_attendance(meeting)
		users = User.all
		attendacne_hash = Hash[users.map {|user| [user.name, Relationship.where(meeting_id: meeting.id, user_id: user.id).count]}]
	end
end

