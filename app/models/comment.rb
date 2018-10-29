class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true,counter_cache: :commentable_count, dependent: :destroy
	has_many :comments, as: :commentable
	belongs_to :user, optional: true, dependent: :destroy

	validates :user_id, presence: true
end