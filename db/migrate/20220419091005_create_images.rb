class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.string   :image_url

      t.timestamps
    end
  end
end
