class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :analysis 
      t.string :etype
      t.string :label
      t.string :desc
      t.integer :magnitude, :default=>5
      t.integer :x
      t.integer :y
      t.date :edate
      t.timestamps
    end
  end
end
