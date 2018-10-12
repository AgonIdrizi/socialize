class ChangeColumnTypeToUSers < ActiveRecord::Migration[5.2]
  def change
  	change_column :comments, :user_id, :integer
  end
end
