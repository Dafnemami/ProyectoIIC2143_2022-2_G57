class AddRunToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :run, :string
  end
end
