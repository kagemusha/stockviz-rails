class CreateAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :analyses do |t|
      t.references :user_profile
      t.references :group
      t.references :category
      t.string :topic
      t.json :body

      t.timestamps
    end
  end
end
