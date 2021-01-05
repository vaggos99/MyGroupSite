class RemoveTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :friends
    drop_table :allposts
      drop_table :posts
  end
end
