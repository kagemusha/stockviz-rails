class CreateAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :analyses do |t|
      t.references :user_profile
      t.references :group
      t.references :category
      t.string :topic
      t.string :status, :default => 'active'

      t.timestamps
    end

    add_index(:analyses, [:user_profile_id, :topic], unique: true)
  end
end
