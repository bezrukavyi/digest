module MailingLists
  class EntitySerializer < BaseSerializer
    set_type :mailing_list
    set_id :id

    attributes :name, :description, :created_at, :updated_at, :slug

    has_one :last_issue, serializer: 'Issues'
  end
end
