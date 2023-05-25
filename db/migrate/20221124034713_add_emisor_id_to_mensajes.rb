class AddEmisorIdToMensajes < ActiveRecord::Migration[6.0]
  def change
    add_column :mensajes, :emisor_id, :string
  end
end
