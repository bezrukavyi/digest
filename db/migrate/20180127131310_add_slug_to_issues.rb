class AddSlugToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :slug, :string
    add_index :issues, :slug
  end
end
