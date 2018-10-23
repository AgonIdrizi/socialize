class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :friends, foreign_key: 'friend_id', class_name: 'Friendship' , dependent: :destroy

  has_many :friend_requests_sent_relationship, foreign_key: 'sender_id' , class_name: 'Request'
  has_many :friend_requests_sent, through: :friend_requests_sent_relationship, source: :accepter

  has_many :friend_requests_received_relationship, foreign_key: 'accepter_id', class_name: 'Request'
  has_many :friend_requests_received, through: :friend_requests_received_relationship, source: :sender


  has_many :friends_relationship, foreign_key: 'friend_id' , class_name: 'Friendship' , dependent: :destroy
  has_many :friends, through: :friends_relationship, source: :user

  has_many :posts
  has_many :likes
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'

  has_one_attached :image

  after_commit :add_default_cover, on: [:create, :update]

  def self.create_from_provider_data(params)
    user = User.find_or_create_by(email: params.info.email)
    user.update({
      uid: params.uid,
      token: params.credentials.token,
      name:  params.info.name 
      })
    user
  end



  


  private
    

    def add_default_cover
      unless self.image.attached?
        self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-picture.jpg")), filename: 'default-picture.jpg' , content_type: "image/jpg")
      end
    end



end
