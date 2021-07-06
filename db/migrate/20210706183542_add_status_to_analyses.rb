class AddStatusToAnalyses < ActiveRecord::Migration[6.1]
  def change
    add_column :analyses, :status, :string, :default => 'active'
  end
end
