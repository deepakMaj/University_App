class ChangeTb < ActiveRecord::Migration[6.0]
  def change
    rename_table :admin_users, :users
  end
end
