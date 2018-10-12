class Friendship < ApplicationRecord
	after_save :destroy_request_relationship
	belongs_to :user, foreign_key: 'user_id', class_name: 'User'

	def destroy_request_relationship # a callback to destroy a request, if user accepted frindship
		Request.where(["sender_id = ? and accepter_id = ?", self.user_id, self.friend_id]).destroy_all
	end
end
