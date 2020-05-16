class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.date :validate_date
      t.integer :quantity
      t.string :status
      t.float :price
      t.float :weight

      t.timestamps
    end
  end
end
