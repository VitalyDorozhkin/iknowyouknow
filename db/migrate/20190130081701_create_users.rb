class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.integer :age
      t.string :login
      t.string :password
      t.integer :rating
      t.string :awards
      t.string :email
      t.string :phone
      t.string :description


      t.timestamps
    end
  end
end
