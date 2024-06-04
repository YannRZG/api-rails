class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

         validates :email, presence: true, uniqueness: true

         has_many :articles
         has_many :comments
         has_many :photos, dependent: :destroy
    def jwt_payload
      super
    end
end
