class IssueItem < ApplicationRecord
  belongs_to :issue
  belongs_to :subtitle

  validates :issue, presence: true
end
