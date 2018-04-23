module MailingLists::Contracts
  class Create < BaseForm
    EXCLUDE_WORDS = YAML.load_file('config/static.yml')[:mailing_list][:exclude_words]

    property :name
    property :slug
    property :description
    property :user

    validates :name, :slug, format: { without: Regexp.new(EXCLUDE_WORDS.join('|')) }
    validates :name, :description, :slug, :user, presence: true
    validates_uniqueness_of :slug
  end
end
