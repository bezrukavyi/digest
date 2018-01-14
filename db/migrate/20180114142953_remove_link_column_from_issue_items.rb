class RemoveLinkColumnFromIssueItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :issue_items, :link
  end
end
