class CreateEmploys < ActiveRecord::Migration
  def change
    create_table :employs do |t|
      t.string :name
      t.string :position
      t.string :phone
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
