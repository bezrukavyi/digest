class AddSlugForMailingLists < ActiveRecord::Migration[5.1]
  def change
    add_column :mailing_lists, :slug, :string, null: false
    add_index :mailing_lists, :slug, unique: true
  end
end
