class MailingList < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  has_many :subscriptions, dependent: :destroy
  has_many :issues, dependent: :destroy

  def last_issue
    @last_issue ||= issues.released.last
  end
end
