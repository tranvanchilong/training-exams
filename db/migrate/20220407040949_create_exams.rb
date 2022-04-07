class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|

      t.timestamps
    end
  end
end
