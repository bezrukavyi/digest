module Dashboard::Subtitles::Contracts
  class Create < BaseForm
    property :name
    property :issue_id

    validates :name, presence: true

    collection :issue_items, populate_if_empty: IssueItem, form: Dashboard::IssueItems::Contracts::Create

    def sync(issue_id)
      super do |attributes|
        model.assign_attributes(attributes.except(:issue_items).merge(issue_id: issue_id))
        model.save
        issue_items.each { |form| form.sync(model.id) }
      end
    end
  end
end
