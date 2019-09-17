require 'elasticsearch/model'

class Message < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    # model association
    belongs_to :chat

    # validations
    validates :name, presence: true, length: {minimum: 4}
    validates :number, presence: true, numericality: {only_integer: true, greater_than: 0}, uniqueness: {scope: :chat_id}
end
