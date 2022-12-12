class CreateDangerousSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :dangerous_spots do |t|
      t.string :address
      t.text :content
      t.float :latitude
      t.float :longitude
      t.string :image

      t.timestamps
    end
  end
end
