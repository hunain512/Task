class CreateUserStores < ActiveRecord::Migration[6.1]
  def change
    create_table :user_stores do |t|
      t.integer :user_id
      t.integer :store_id
      t.timestamps
    end
  end
end
