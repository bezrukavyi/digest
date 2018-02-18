module MailingLists
  class CreateContract < BaseForm
    property :name
    property :slug
    property :description

    validates :name, :description, :slug, presence: true
    validates :slug, unique: true
  end
end
