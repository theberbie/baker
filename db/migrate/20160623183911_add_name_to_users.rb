class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :phone_number, :integer
    add_column :users, :date_of_birth, :datetime
    add_column :users, :favorite_color, :string
    add_column :users, :favorite_song, :string

  end
end
