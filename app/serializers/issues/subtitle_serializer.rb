module Issues
  class SubtitleSerializer < BaseSerializer
    set_type :subtitle
    set_id :id

    attributes :name, :issue_id, :created_at

    has_many :issue_items, serializer: 'IssueItem'
  end
end
