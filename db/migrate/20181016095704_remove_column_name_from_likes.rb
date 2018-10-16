class RemoveColumnNameFromLikes < ActiveRecord::Migration[5.2]
  def change
  	remove_column :likes, :name
  end
end
