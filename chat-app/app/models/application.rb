class Application < ApplicationRecord
    has_secure_token

    # model association
    has_many :chats, dependent: :destroy

    # validations
    validates :name, presence: true, length: {minimum: 4}
end
