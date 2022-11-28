class Log < ApplicationRecord
    belongs_to :item
    with_options presence: true do
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    end
end
