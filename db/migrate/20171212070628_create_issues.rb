class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.belongs_to :mailing_list, foreign_key: true
      t.datetime :release_at
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
