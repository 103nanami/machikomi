class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|

      t.timestamps

      t.integer :latitude
      t.integer :longitude
    end
  end
end
