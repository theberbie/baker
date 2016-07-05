class AddBigIntToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phone_number, :integer
    remove_column :users, :date_of_birth, :datefield
    add_column :users, :phone_number, :bigint
    add_column :users, :date_of_birth, :bigint
  end
end
