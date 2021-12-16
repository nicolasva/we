class Pros < ActiveRecord::Migration[6.1]
  def change
    create_table :pros, force: :cascade do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.integer :lat, null: false
      t.integer :lng, null: false
      t.integer :max_kilometers, null: false
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
