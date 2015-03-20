class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates  :comment, presence: true

  # For notifications
  def send_notifications!
    users = post.users.uniq - [user]
    users.each do |user|
    	NotificationMailer.comment_notification(user, self).deliver_later
    end
  end
end
