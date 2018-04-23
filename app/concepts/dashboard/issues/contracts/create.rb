module Dashboard::Issues::Contracts
  class Create < BaseForm
    property :mailing_list_id
    property :release_at
    property :published, default: false
    property :name

    validates :mailing_list_id, :release_at, :name, presence: true

    collection :issue_items, populate_if_empty: IssueItem, form: Dashboard::IssueItems::Contracts::Create

    collection :subtitles, populate_if_empty: Subtitle, form: Dashboard::Subtitles::Contracts::Create

    def save
      super do |attributes|
        model.assign_attributes(attributes.except(:subtitles, :issue_items))
        model.save
        issue_items.each { |form| form.sync(model.id) }
        subtitles.each { |form| form.sync(model.id) }
      end
    end
  end
end
