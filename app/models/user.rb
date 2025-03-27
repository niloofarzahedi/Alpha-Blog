class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable,
            :omniauthable, omniauth_providers: [:google_oauth2]
    # has_many :posts, dependent: :destroy
    # validates :name, presence: true, 
    #                  uniqueness: { case_sensitive: false }, 
    #                  length: {minimum:3, maximum:25}
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # validates :email, presence: true, 
    #                   uniqueness: { case_sensitive: false }, 
    #                   length: {maximum:105},
    #                   format: { with: VALID_EMAIL_REGEX }

    # def self.from_omniauth(auth)
    # # Find the user by email, or create a new user
    #     user = User.where(email: auth.info.email).first_or_initialize do |u|
    #         u.name = auth.info.name
    #         u.email = auth.info.email
    #         u.password = Devise.friendly_token[0, 20]
    #         u.provider = auth.provider
    #         u.uid = auth.uid
    #     end
    #     user.save if user.new_record?
    #     user
    # end
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.name = auth.info.name
      end    
    end  
end
