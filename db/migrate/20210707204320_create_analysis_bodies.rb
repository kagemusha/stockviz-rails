class CreateAnalysisBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :analysis_bodies do |t|
      t.json :body
      t.timestamps
    end
  end
end
