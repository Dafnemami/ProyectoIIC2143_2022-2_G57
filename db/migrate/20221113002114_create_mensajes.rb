class CreateMensajes < ActiveRecord::Migration[6.0]
  def change
    create_table :mensajes do |t|
      t.string :emisor
      t.string :receptor
      t.text :cuerpo

      t.timestamps
    end
  end
end
