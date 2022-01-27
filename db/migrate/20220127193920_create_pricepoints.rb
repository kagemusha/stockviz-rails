class CreatePricepoints < ActiveRecord::Migration[6.1]
  def change
    create_table :pricepoints do |t|
      t.references :analysis 
      t.string :pptype
      t.string :label, :null=>false
      t.string :desc
      t.decimal :price, :null=>false
      t.date :date, :null=>false
      t.timestamps
    end
  end
end
