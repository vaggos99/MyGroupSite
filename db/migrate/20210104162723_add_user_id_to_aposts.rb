class AddUserIdToAposts < ActiveRecord::Migration[5.1]
  def change
    add_column :aposts, :user_id, :integer
    add_index :aposts, :user_id
  end
end
