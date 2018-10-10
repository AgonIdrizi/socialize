class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, foreign_key: 'friend_id', class_name: 'Friendship' , dependent: :destroy

  has_many :friend_requests_sent_relationship, foreign_key: 'sender_id' , class_name: 'Request'
  has_many :friend_requests_sent, through: :friend_requests_sent_relationship, source: :accepter

  has_many :friend_requests_received_relationship, foreign_key: 'accepter_id', class_name: 'Request'
  has_many :friend_requests_received, through: :friend_requests_received_relationship, source: :sender


  has_many :friends_relationship, foreign_key: 'user_id' , class_name: 'Friendship' , dependent: :destroy
  has_many :friends, through: :friends_relationship, source: :user

  
end
