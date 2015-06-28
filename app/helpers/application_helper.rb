module ApplicationHelper
	def admin?
		if current_user && current_user.admin == true
			true
		else
			false
		end
	end

	def give_title(title)
		site = "THS DECA"
		if title.empty?
			site
		else
			"#{title} | #{site}"
		end
	end
end
