class Issue < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged]

  belongs_to :mailing_list
  has_many :subtitles, dependent: :destroy
  has_many :issue_items, dependent: :destroy

  scope :awaiting, -> { where(published: false).where('release_at <= ?', Time.zone.now) }
  scope :released, -> { where(published: true) }
  scope :newest, -> { order(created_at: :desc) }

  # validates :name, presence: true

  before_create :increment_release

  def next
    @next ||= released_issues.where('release_number > ?', release_number).first
  end

  def prev
    @prev ||= released_issues.where('release_number < ?', release_number).last
  end

  private

  def released_issues
    mailing_list.issues.released
  end

  def increment_release
    self.release_number = Issue.where(mailing_list_id: mailing_list_id).last&.release_number.to_i + 1
  end
end
