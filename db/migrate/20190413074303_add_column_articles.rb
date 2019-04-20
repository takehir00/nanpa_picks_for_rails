class AddColumnArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :title, :text

    add_column :articles, :src, :text
  end
end
