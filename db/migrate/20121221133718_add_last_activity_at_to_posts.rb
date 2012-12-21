class AddLastActivityAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :last_activity_at, :datetime
  end
end
