class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.integer :image_id
      t.string :name
      t.timestamps
    end
  end
end
