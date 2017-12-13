class Subtitle < ApplicationRecord
  belongs_to :issue
  has_many :issue_items

  validates :name, :issue, presence: true
end
