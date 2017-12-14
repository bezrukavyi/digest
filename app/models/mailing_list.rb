class MailingList < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  has_many :subscriptions
  has_many :issues

  validates :name, :description, :slug, presence: true
  validates :slug, uniqueness: true
end
