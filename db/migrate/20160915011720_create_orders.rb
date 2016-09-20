class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2

      t.timestamps
    end
  end
end