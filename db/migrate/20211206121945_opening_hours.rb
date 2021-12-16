class OpeningHours < ActiveRecord::Migration[6.1]
  def change
    create_table :openning_hours, force: :cascade do |t|
      t.string :day, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.references :pro, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
