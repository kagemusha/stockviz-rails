class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :analysis 
      t.string :etype
      t.string :label, :null=>false
      t.string :desc
      t.integer :magnitude, :default=>3
      t.date :edate, :null=>false
      t.timestamps
    end
  end
end
