class AddArtisanInfo < ActiveRecord::Migration
  def change
   add_column  :artisans, :name, :string
    add_column :artisans, :username, :string
    add_column :artisans, :phone_number, :integer
    add_column :artisans, :date_of_birth, :datetime
    add_column :artisans, :favorite_color, :string
    add_column :artisans, :favorite_song, :string

  end
end
