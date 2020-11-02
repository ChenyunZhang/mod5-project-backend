class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar, dependent: :destroy
    has_many :posts, dependent: :destroy

    validates_uniqueness_of :email
    validates :password, length: { in: 6..20 }
end
