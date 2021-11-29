class CreateAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :analyses do |t|
      t.references :profile
      t.references :group
      t.references :category
      t.string :topic
      t.string :status, :default => 'active'

      t.timestamps
    end

    add_index(:analyses, [:profile_id, :topic], unique: true)
  end
end
