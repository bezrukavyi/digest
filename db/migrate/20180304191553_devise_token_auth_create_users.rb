class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, default: "email"
      t.string :uid, null: false, default: ""

      ## User Info
      t.string :name

      ## Tokens
      t.json :tokens
    end
  end
end
