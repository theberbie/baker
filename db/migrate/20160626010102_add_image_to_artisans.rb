class AddImageToArtisans < ActiveRecord::Migration
  def change
    add_column :artisans, :image, :string
  end
end
