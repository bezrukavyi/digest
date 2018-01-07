class IssueItem < ApplicationRecord
  belongs_to :issue
  belongs_to :subtitle, optional: true

  scope :top, -> { where(subtitle: nil) }

  validates :issue, presence: true
end
