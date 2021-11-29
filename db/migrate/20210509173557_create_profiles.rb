class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :auth0_id
      t.string :screen_name

      t.timestamps
    end

    add_index :profiles, :auth0_id, unique: true
  end
end
