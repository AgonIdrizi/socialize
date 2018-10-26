module FriendshipsHelper

	def display_posts_of_current_user
	  !current_user.friends_relationship.find_by(user_id: current_user.id).present?
	end
end
