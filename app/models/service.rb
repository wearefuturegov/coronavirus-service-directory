class Service < ApplicationRecord
  has_and_belongs_to_many :categories

  geocoded_by :postcode
  after_validation :geocode

  validates :name, presence: true

  paginates_per 12

  def rough_distance
      if distance < 1
        "Less than a mile away"
      elsif (1 < distance) && (distance < 2)
        "About a mile away"
      else
        "About #{distance.round} miles away"
      end
  end

end
