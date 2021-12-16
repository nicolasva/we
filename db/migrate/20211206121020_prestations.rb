class Prestations < ActiveRecord::Migration[6.1]
  def change
    create_table :prestations, force: :cascade do |t|
      t.string :reference, null: false
      t.integer :duration, null: false
      t.timestamps
    end
  end
end
