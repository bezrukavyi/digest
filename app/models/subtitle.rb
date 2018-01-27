class Subtitle < ApplicationRecord
  default_scope { includes(:issue_items) }

  belongs_to :issue
  has_many :issue_items

  validates :name, :issue, presence: true
end
