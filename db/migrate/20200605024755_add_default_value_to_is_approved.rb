class AddDefaultValueToIsApproved < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :is_approved, :boolean, :default => false
  end
end
