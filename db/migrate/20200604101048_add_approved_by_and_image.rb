class AddApprovedByAndImage < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :approved_by, :integer
    add_column :posts, :approved_date, :datetime
    add_column :posts, :is_approved, :boolean
    add_column :posts, :image, :string
  end
end
