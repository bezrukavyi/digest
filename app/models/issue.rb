class Issue < ApplicationRecord
  belongs_to :mailing_list
  has_many :subtitles

  scope :awaiting, -> { where(published: false).where("release_at <= ?", Time.zone.now) }
  scope :released, -> { where(published: true) }

  validates :name, presence: true

  before_create :increment_release

  private

  def increment_release
    self.release_number = Issue.where(mailing_list_id: self.mailing_list_id).last&.release_number.to_i + 1
  end
end
