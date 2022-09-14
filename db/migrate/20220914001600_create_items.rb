class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description
      t.boolean :in_stock, default: true
      t.decimal :sale_price, default: 0

      t.timestamps
    end
  end
end
