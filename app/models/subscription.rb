class Subscription < ApplicationRecord
  include AASM
  belongs_to :mailing_list

  scope :active, -> { where(aasm_state: :active) }

  aasm whiny_transitions: false do
    state :pending, initial: true
    state :active
    state :canceled

    event :activate, after: :confirmation_token! do
      transitions from: %i[pending canceled], to: :active
    end

    event :cancel, after: :confirmation_token! do
      transitions from: :active, to: :canceled
    end
  end

  def confirmation_token!
    ConfirmationToken.call(self)
  end
end
