class Review < ApplicationRecord
    
    belongs_to :sauna
    belongs_to :user
    has_many :comments, dependent: :destroy
end
