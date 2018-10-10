class Friendship < ApplicationRecord
	belongs_to :user, foreign_key: 'friend_id', class_name: 'User'
end
