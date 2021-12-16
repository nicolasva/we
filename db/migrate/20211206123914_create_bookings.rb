class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings, force: :cascade do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.datetime :starts_at, null: false
      t.text :address, null: false
      t.integer :lat
      t.integer :lng
      t.timestamps
      t.float :latitude
      t.float :longitude
    end
  end
end
