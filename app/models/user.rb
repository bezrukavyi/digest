class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :confirmable

  has_many :auth_providers, as: :resource, dependent: :destroy
end
