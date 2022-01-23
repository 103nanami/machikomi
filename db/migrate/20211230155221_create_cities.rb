class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|

      t.timestamps
      t.string :name
      t.integer :column_id

    end
  end
end
