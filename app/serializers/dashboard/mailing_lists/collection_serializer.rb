module Dashboard::MailingLists
  class CollectionSerializer < BaseSerializer
    set_type :mailing_list
    set_id :id

    attributes :name, :description, :created_at, :updated_at, :slug, :user_id
  end
end
