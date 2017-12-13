class MailingList < ApplicationRecord
  has_many :subscriptions
  has_many :issues

  validates :name, :description, presence: true
end
