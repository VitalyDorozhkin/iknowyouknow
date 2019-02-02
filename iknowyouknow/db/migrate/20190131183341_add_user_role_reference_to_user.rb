class AddUserRoleReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_role, foreign_key: true
  end
end
