class AddRemoveAnalysisIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index(:analyses, [:profile_id, :topic], unique: true)
    add_index(
      :analyses, 
      [:profile_id, :topic, :category_id, :status], 
      unique: true,
      name: 'analysis_topic_index')
  end
end
