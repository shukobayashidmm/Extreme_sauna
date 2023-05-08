class Sauna < ApplicationRecord
    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    
    has_many :reviews, dependent: :destroy
end
