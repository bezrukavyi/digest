class AddNameToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :name, :string
  end
end
