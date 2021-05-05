class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :user_profile

      t.timestamps
    end
  end
end
