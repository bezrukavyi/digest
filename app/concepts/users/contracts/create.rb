module Users::Contracts
  class Create < BaseForm
    property :email
    property :password

    property :password_confirmation

    validates :email, email: true
    validates :password, confirmation: true
    validates :email, :password, :password_confirmation, presence: true
  end
end
