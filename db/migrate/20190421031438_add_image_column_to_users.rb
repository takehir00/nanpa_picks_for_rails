class AddImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image_name, :string
    add_column :users, :image, :string
  end
end
