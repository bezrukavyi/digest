class MailingList < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :issues, dependent: :destroy

  def last_issue
    @last_issue ||= issues.released.last
  end
end
