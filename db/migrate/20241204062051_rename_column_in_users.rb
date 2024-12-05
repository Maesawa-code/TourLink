class RenameColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :age_group, :age_group_id
    rename_column :users, :gender, :gender_id
  end
end
