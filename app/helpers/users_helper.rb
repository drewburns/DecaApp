module UsersHelper
	def email_list(users)
		email_list = users.collect {|user| user.email}
		email_list.join(",")
	end

	def get_attendance(user)
		meetings = Meeting.all
		attendacne_hash = Hash[meetings.map {|meeting| [meeting.title, Relationship.where(meeting_id: meeting.id, user_id: user.id).count]}]
	end
end
