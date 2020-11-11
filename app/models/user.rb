class User < ApplicationRecord
    attr_accessor :reset_token
    has_secure_password
    has_one_attached :avatar, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :votedowns, dependent: :destroy
    has_many :voteups, dependent: :destroy
    has_many :books, through: :posts


    validates_uniqueness_of :email
    # validates :password, length: { in: 6..20 }


    def send_password_reset
        self.reset_digest = generate_base64_token
        self.reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver_now
      end
    
      def password_token_valid?
        (self.reset_sent_at + 1.hour) > Time.zone.now
      end
    
      def reset_password(password)
        self.reset_digest = nil
        self.password = password
        save!
      end

    def self.from_omniauth(auth)
      p auth.info
      where(email: auth.info.email).first_or_initialize do |user|
        # user.avatar = auth.info.image
        user.username = auth.info.name
        user.email=auth.info.email
        user.avatar = auth.info.imageUrl
        user.password = SecureRandom.urlsafe_base64
      end
    end

    private

    def generate_base64_token
      test = SecureRandom.urlsafe_base64
    end

end
