class Subscription < ApplicationRecord
  include AASM
  belongs_to :mailing_list

  validates :email, :mailing_list, presence: true
  validates :email, uniqueness: { scope: :mailing_list_id }

  aasm do
    state :pending, initial: true
    state :active
    state :canceled
  end
end
