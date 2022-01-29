class RemoveImageIdEromPostFavories < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_favorites, :image_id, :text
  end
end
