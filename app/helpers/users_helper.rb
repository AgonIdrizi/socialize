module UsersHelper
  
  def show_all_posts_of_friends
  	friends = current_user.friends
  	friends << current_user if display_posts_of_current_user
	friends.includes(posts: [{comments: :user},{image_attachment: :blob}],image_attachment: [:blob]).order(created_at: :ASC)
  end
end
