class CreateExamCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :exam_carts do |t|
      t.references :exam, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
