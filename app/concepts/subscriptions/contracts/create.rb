module Subscriptions::Contracts
  class Create < BaseForm
    property :email
    property :mailing_list_id

    validates :email, :mailing_list_id, presence: true
    validates :email, email: true
    validates_uniqueness_of :email, scope: :mailing_list_id
  end
end
