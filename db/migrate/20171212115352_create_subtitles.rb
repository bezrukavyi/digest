class CreateSubtitles < ActiveRecord::Migration[5.1]
  def change
    create_table :subtitles do |t|
      t.string :name, null: false
      t.belongs_to :issue, foreign_key: true

      t.timestamps
    end
  end
end
