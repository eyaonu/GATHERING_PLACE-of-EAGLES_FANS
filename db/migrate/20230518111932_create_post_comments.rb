class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references  :user,     foreign_key: { to_table: :users },null: false
      t.references  :post,     foreign_key: { to_table: :posts },null: false
      t.text :comment
      t.timestamps
    end
  end
end