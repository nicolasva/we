class CreateProPrestations < ActiveRecord::Migration[6.1]
  def change
    create_table :pro_prestations do |t|
      t.references :pro, foreign_key: true, null: false, index: true
      t.references :prestation, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
