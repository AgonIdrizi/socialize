class ChangeColumnNameOfRequests < ActiveRecord::Migration[5.2]
  def change
  	rename_column :requests, :requestor_id, :accepter_id
  end
end
