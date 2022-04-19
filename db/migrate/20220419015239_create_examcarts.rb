class CreateExamcarts < ActiveRecord::Migration[6.0]
  def change
    create_table :examcarts do |t|
      t.integer :user_id
      t.integer :exam_id

      t.timestamps
    end
    add_index :examcarts, :user_id
    add_index :examcarts, :exam_id
    add_index :examcarts, [:user_id, :exam_id], unique: true
  end
end
