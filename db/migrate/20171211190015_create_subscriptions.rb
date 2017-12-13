class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :email, null: false
      t.belongs_to :mailing_list, foreign_key: true
      t.string :aasm_state

      t.timestamps
    end

    add_index :subscriptions, [:email, :mailing_list_id], unique: true
  end
end
