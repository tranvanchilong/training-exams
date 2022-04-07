class CreateUserExams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_exams do |t|
      t.references :exam, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :total_score
      t.time :completed_time
      t.boolean :is_passed, default: false
      t.integer :total_test

      t.timestamps
    end
  end
end
