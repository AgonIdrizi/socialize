class Like < ApplicationRecord
	belongs_to :posts, optional: true, polymorphic: true
end
