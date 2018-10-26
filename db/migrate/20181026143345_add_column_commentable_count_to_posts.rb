class AddColumnCommentableCountToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :commentable_count, :integer, default: 0
  end
end
