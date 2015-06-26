module ApplicationHelper
	def admin?
		if current_user && current_user.admin == true
			true
		else
			false
		end
	end
end
