class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments, as: :commentable
	has_many :likes, as: :likeable
	has_one_attached :image
	validates :user_id, presence: true

	
end
