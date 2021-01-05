class AddCategoryToAposts < ActiveRecord::Migration[5.1]
  def change
    add_column :aposts, :category_id, :integer
  end
end
