module Issues
  class IssueItemSerializer < BaseSerializer
    set_type :issue_item
    set_id :id

    attributes :issue_id, :subtitle_id, :source, :description, :created_at,
               :title

    attribute :source_url do |object|
      Rails.application.routes.url_helpers.api_v1_link_url(object.link.id)
    end
  end
end
