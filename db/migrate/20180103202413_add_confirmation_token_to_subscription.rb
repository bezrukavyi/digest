class AddConfirmationTokenToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :confirmation_token, :string
  end
end
