class CreateAgeGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :age_groups do |t|

      t.timestamps
    end
  end
end
