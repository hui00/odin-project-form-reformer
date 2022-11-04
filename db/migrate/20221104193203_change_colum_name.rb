class ChangeColumName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_disgest, :password_digest
  end
end
