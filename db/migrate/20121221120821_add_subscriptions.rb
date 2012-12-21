class AddSubscriptions < ActiveRecord::Migration
  def up
    remove_column "comments", "author_name"
    remove_column "comments", "author_email"
    remove_column "comments", "author_website"
    
    create_table :subscriptions do |t|
      t.integer  :subscribable_id
      t.string   :subscribable_type
      t.integer  :user_id
      t.datetime :last_read_at
      
      t.timestamp
    end
  end

  def down
    add_column "comments", "author_name", :string
    add_column "comments", "author_email", :string
    add_column "comments", "author_website", :string
  end
end
