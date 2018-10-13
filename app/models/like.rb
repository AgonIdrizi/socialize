class Like < ApplicationRecord
	belongs_to :posts, optional: true, polymorphic: true

	validates :user_id, uniqueness: {
		scope: :likeable_id,
		message: "You have already liked this post"
	}
end
