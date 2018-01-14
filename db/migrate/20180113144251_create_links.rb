class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :url
      t.belongs_to :issue_item, foreign_key: true

      t.timestamps
    end
  end
end
