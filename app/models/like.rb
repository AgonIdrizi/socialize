class Like < ApplicationRecord
	belongs_to :likeable, optional: true, polymorphic: true, counter_cache: :likeable_count
	belongs_to :user, optional: true
	validates :user_id, uniqueness: {
		scope: :likeable_id,
		message: "You have already liked this post"
	}
end
