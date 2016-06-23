class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :name
      t.text     :description
      t.decimal  :cost
      t.integer  :user_id
      t.string   :category


      t.timestamps
    end

    add_index :products, :user_id
  end
end
