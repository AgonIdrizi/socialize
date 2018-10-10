class Request < ApplicationRecord
	belongs_to :accepter, foreign_key: 'accepter_id', class_name: 'User', optional: true
	belongs_to :sender, foreign_key: 'sender_id', class_name: 'User', optional:true
end
