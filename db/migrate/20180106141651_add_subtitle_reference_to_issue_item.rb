class AddSubtitleReferenceToIssueItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :issue_items, :subtitle
  end
end
