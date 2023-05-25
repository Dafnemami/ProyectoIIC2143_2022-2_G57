class AddImageUrlToCanchas < ActiveRecord::Migration[6.0]
  def change
    add_column :canchas, :image_url, :string
  end
end
