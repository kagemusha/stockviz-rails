class CreateFactors < ActiveRecord::Migration[6.1]
  def change
    create_table :factors do |t|
      t.references :analysis 
      t.string :ftype
      t.string :label
      t.string :desc
      t.integer :x
      t.integer :y
      t.integer :positivity
      t.timestamps
    end
  end
end
