module AuthProviders
  class CreateContract < BaseForm
    property :name
    property :uid
    property :resource

    validates :name, :uid, :resource, presence: true
    validates_uniqueness_of :uid, scope: :name
  end
end
