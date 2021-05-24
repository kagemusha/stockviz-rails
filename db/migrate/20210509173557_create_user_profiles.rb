class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :auth0_id
      t.string :screen_name

      t.timestamps
    end

    add_index :user_profiles, :auth0_id, unique: true
  end
end
