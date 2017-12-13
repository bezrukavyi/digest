class CreateIssueItems < ActiveRecord::Migration[5.1]
  def change
    create_table :issue_items do |t|
      t.belongs_to :issue, foreign_key: true
      t.string :source, null: false
      t.string :link, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
