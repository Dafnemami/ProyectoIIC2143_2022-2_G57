class AddPriceToCanchas < ActiveRecord::Migration[6.0]
  def change
    add_column :canchas, :price, :integer
  end
end
