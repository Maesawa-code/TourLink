class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :post, null: false, foreign_key: true 
      t.references :user, null: false, foreign_key: true 
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end
