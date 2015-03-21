class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  # For notifications
  has_many :users, through: :comments

  validates :title, :content, :category_id, presence: true
  validates :title, length: {minimum: 5, maximum: 100}
end
