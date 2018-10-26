class AddUniqeIndexToFrindships < ActiveRecord::Migration[5.2]
  def change
  	add_index :friendships, [:friend_id,:user_id]
  end
end
