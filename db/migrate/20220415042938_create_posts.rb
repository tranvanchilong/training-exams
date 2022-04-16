class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :body
      t.integer :exam_id
      t.text :body

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :exam_id
  end
end
