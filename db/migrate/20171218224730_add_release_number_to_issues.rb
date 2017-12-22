class AddReleaseNumberToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :release_number, :integer
  end
end
