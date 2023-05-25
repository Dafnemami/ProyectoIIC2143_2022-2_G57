class RemoveIdArrendatarioFromCanchas < ActiveRecord::Migration[6.0]
  def change
    remove_column :canchas, :id_arrendatario, :string
  end
end
