module ApplicationHelper

	def errors_display(set)
		if set.errors.any?
			set.errors.full_messages.each do |message|
				message
			end
		end
	end
end
