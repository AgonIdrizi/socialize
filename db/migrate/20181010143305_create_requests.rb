class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :sender_id,index: true
      t.integer :requestor_id,index: true

      t.timestamps
    end
  end
end
