class AddProviderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    
    add_index :users, :provider
  end
end
