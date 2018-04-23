module Dashboard::IssueItems::Contracts
  class Create < BaseForm
    property :issue_id
    property :source
    property :subtitle_id
    property :title
    property :description

    validates :source, :title, :description, presence: true

    def sync(issue_id)
      super do |attributes|
        model.assign_attributes(attributes.merge(issue_id: issue_id))
        model.save
      end
    end
  end
end
