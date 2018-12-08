class Request < ApplicationRecord
	before_save :cant_send_request_to_himself
	before_save :check_if_friendship_exists
	
	belongs_to :accepter, foreign_key: 'accepter_id', class_name: 'User', optional: true
	belongs_to :sender, foreign_key: 'sender_id', class_name: 'User', optional:true


	

	private
	def check_if_friendship_exists #callback to destroy a request, if a friendship already exists
	  if Friendship.where(["friend_id = ? and user_id = ?", self.accepter_id, self.sender_id]).present? || 
	  	 Friendship.where(["friend_id = ? and user_id = ?", self.sender_id, self.accepter_id]).present?
	  	self.destroy
	  end
	end

	def cant_send_request_to_himself
	  if self.sender_id == self.accepter_id
		self.destroy
	  end
	end
end
