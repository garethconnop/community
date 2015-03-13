class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :title, :content, :category_id, presence: true
  validates :title, length: {minimum: 5}
end
