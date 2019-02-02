class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :service_id
      t.integer :status
      t.string :comment
      t.integer :student_id
      t.timestamps
    end
  end
end
