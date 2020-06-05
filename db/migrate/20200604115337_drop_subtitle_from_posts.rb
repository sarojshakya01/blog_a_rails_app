class DropSubtitleFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :subtitle
  end
end
