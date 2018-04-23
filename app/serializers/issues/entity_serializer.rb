module Issues
  class EntitySerializer < BaseSerializer
    set_type :issue
    set_id :id

    attributes :mailing_list_id, :release_at, :published, :created_at,
               :updated_at, :name, :release_number, :slug

    has_many :subtitles, serializer: 'Subtitle'
    has_many :subtitles_items, serializer: 'IssueItem'
    has_many :top_items, serializer: 'IssueItem'
  end
end
