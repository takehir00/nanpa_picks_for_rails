class ChangeColumnNullUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :password_digest, false
  end
end