class IssueItem < ApplicationRecord
  default_scope { includes(:link) }

  belongs_to :issue
  belongs_to :subtitle, optional: true

  has_one :link, dependent: :destroy

  scope :top, -> { where(subtitle: nil) }

  # validates :issue, presence: true
end
