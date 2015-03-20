# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def comment_notification
  	NotificationMailer.comment_notification(User.first, Comment.first)
  end
end
