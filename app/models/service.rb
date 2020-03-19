class Service < ApplicationRecord
    geocoded_by :postcode
    after_validation :geocode 
end
