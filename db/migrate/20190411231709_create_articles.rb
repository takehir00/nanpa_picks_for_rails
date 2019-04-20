class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :url, null: false

      t.timestamps
    end
  end
end
