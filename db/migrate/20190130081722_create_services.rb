class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :teacher_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
