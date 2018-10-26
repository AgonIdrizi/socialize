class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments, as: :commentable
	has_many :likes, as: :likeable

	validates :user_id, presence: true

	
end
