class ChangePasss < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :password_digest
  end
end
