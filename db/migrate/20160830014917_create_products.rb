class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :artist
      t.string :album
      t.string :year
      t.string :weight
      t.string :genre
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
