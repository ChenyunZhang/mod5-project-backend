class User < ApplicationRecord
    attr_accessor :reset_token
    has_secure_password
    has_one_attached :avatar, dependent: :destroy
    has_many :posts, dependent: :destroy

    validates_uniqueness_of :email
    validates :password, length: { in: 6..20 }

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def self.create_from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
            user.image_url = auth.info.image
        end
    end
end
