class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :nameTask
      t.string :status
      t.string :date
      t.integer :employ_id

      t.timestamps null: false
    end
  end
end
