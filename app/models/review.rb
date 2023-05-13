class Review < ApplicationRecord
    
    belongs_to :sauna
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :content, presence: true
    validates :star, presence: true
end
