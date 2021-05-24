class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :user_profile

      t.timestamps
    end

    add_index(:groups, [:user_profile_id, :name], unique: true)
  end
end
