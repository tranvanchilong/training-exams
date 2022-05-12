class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :time_limit
      t.integer :pass_score

      t.timestamps
    end
  end
end
