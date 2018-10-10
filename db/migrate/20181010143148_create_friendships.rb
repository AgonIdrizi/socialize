class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :friend_id, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
