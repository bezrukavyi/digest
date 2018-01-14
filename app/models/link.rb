class Link < ApplicationRecord
  belongs_to :issue_item

  validates :url, presence: true
end
