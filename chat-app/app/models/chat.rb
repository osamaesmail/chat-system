class Chat < ApplicationRecord
    # model association
    belongs_to :application
    has_many :messages, dependent: :destroy

    # validations
    validates :name, presence: true, length: {minimum: 4}
    validates :number, presence: true, numericality: {only_integer: true, greater_than: 0}, uniqueness: {scope: :application_id}
end
