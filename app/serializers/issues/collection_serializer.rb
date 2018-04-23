module Issues
  class CollectionSerializer < BaseSerializer
    set_type :issue
    set_id :id

    attributes :mailing_list_id, :release_at, :name, :release_number, :slug
  end
end
