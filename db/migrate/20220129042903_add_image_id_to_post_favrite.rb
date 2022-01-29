class AddImageIdToPostFavrite < ActiveRecord::Migration[5.2]
  def change

    add_column :post_favorites, :image_id, :text
  end
end
