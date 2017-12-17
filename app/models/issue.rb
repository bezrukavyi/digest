class Issue < ApplicationRecord
  belongs_to :mailing_list
  has_many :subtitles

  scope :awaiting, -> { where(published: false).where("release_at <= ?", Time.zone.now) }

  validates :name, presence: true
end
