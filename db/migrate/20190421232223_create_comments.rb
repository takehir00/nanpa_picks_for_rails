class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
