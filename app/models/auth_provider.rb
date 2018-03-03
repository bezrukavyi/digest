class AuthProvider < ApplicationRecord
  enum name: {
    facebook: 0,
    google: 1
  }

  belongs_to :resource, polymorphic: true, optional: true
end
