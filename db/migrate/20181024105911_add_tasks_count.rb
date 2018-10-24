class AddTasksCount < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :likeable_count, :integer, default: 0
  end
end
