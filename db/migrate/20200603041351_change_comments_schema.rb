class ChangeCommentsSchema < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :email
    add_column :comments, :user_id, :integer
  end
end
