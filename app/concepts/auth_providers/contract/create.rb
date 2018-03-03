module AuthProviders
  class CreateContract < BaseForm
    property :name
    property :uid
    property :resource

    validates :name, :uid, :resource, presence: true
    validates :uid, unique: { scope: :name }
  end
end
