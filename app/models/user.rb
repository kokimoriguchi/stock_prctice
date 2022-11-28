class User < ApplicationRecord
    attr_accessor :remember_token
    has_secure_password
    has_many :logs
    has_many :favorites
    has_many :items, through: :favorites
    has_many :carts, dependent: :destroy
    has_many :buy_items, dependent: :destroy


    validates :login_id, presence: true, length: { maximum: 10 }
    validates :password, presence: true, length: { minimum: 6 }
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

end
