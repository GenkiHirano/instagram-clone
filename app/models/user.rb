class User < ApplicationRecord

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :rememberable

   def remember_me
     true
   end

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid =      auth.uid
       user.name =     auth.name
       user.email =    auth.info.email
       user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
       user.image =    auth.info.image.gsub("picture","picture?type=large") if user.provider == "facebook"
     end
   end
end
