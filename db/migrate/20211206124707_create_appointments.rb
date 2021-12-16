class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.references :pro,  foreign_key: true, null: false, index: true 
      t.timestamps
    end
  end
end
