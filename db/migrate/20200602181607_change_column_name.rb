class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :user_name, :email
  end
end
