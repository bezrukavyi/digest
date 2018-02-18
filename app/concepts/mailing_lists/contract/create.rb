module MailingLists
  class CreateContract < BaseForm
    EXCLUDE_WORDS = YAML.load_file('config/static.yml')[:mailing_list][:exclude_words]

    property :name
    property :slug
    property :description

    validates :name, :slug, format: { without: Regexp.new(EXCLUDE_WORDS.join('|')) }
    validates :name, :description, :slug, presence: true
    validates :slug, unique: true
  end
end
