class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string     :title,              null:false
      t.integer    :bike_genre_id,      null: false
      t.integer    :engine_capacity_id, null: false
      t.integer    :prefecture_id,      null: false
      t.text       :note,               null: false
      t.references :user,               null:false, foreign_key: true

      t.timestamps
    end
  end
end
