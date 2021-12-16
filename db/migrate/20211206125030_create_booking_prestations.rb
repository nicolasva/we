class CreateBookingPrestations < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_prestations do |t|
      t.references :booking, foreign_key: true, null: false, index: true
      t.references :prestation, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
