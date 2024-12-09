class AddScheduledDateToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :scheduled_date, :date
  end
end
