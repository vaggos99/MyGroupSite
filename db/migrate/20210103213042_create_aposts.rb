class CreateAposts < ActiveRecord::Migration[5.1]
  def change
    create_table :aposts do |t|
      t.string :title
      t.string :text
      

      t.timestamps
    end
  end
end
