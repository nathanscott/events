class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.integer :user_id
      t.string :author_name
      t.string :author_email
      t.string :author_website
      t.string :commentable_type
      t.text :body
      
      t.timestamps
    end
  end
end
