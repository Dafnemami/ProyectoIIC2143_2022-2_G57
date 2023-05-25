class CreateCanchas < ActiveRecord::Migration[6.0]
  def change
    create_table :canchas do |t|
      t.string :nombre
      t.string :deporte
      t.string :estado
      t.string :id_arrendatario

      t.timestamps
    end
  end
end
