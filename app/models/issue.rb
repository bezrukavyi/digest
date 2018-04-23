class Issue < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged]

  belongs_to :mailing_list
  has_many :subtitles, dependent: :destroy
  has_many :issue_items, dependent: :destroy
  has_many :top_items, -> { top }, class_name: IssueItem.name
  has_many :subtitles_items, through: :subtitles, source: :issue_items

  scope :awaiting, -> { where(published: false).where('release_at <= ?', Time.zone.now) }
  scope :released, -> { where(published: true) }
  scope :newest, -> { order(created_at: :desc) }

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
