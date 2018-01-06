class Subscription < ApplicationRecord
  include AASM
  belongs_to :mailing_list

  validates :email, :mailing_list, presence: true
  validates :email, uniqueness: { scope: :mailing_list_id }, email: true

  after_create :confirmation_token!

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
    loop do
      token = SecureRandom.hex
      self.confirmation_token = token
      break token unless Subscription.exists?(confirmation_token: token)
    end
    save ? confirmation_token : nil
  end
end
