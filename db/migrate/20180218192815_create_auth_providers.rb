class CreateAuthProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_providers do |t|
      t.string :name
      t.string :uid
      t.references :resource, polymorphic: true

      t.timestamps
    end
  end
end
