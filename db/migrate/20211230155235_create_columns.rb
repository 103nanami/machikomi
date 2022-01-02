class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|

      t.timestamps

      t.string :image_id
      t.integer :city_id
      t.string :title
      t.text :text
    end
  end
end
