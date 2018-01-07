class AddTitleToIssueItem < ActiveRecord::Migration[5.1]
  def change
    add_column :issue_items, :title, :string
  end
end
