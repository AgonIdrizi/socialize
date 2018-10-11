class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :name
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps
    end
  end
end
