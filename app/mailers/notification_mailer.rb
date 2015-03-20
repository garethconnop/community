class NotificationMailer < ApplicationMailer
	default from: "notifications@conditioningcentre.com"

	def comment_notification(user, comment)
		@user = user
		@comment = comment

		mail(
			to: "#{user.email}",
			subject: "[Conditioning Centre] New reply in #{comment.post.title}"
		)
	end
end
