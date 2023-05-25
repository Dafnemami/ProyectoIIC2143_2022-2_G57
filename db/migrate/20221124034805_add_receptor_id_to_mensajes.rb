class AddReceptorIdToMensajes < ActiveRecord::Migration[6.0]
  def change
    add_column :mensajes, :receptor_id, :string
  end
end
