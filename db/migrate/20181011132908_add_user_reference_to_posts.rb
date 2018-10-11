class AddUserReferenceToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, foreign_key: true, index:true
  end
end
