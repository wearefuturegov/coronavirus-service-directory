class Service < ApplicationRecord
  has_and_belongs_to_many :categories

  geocoded_by :postcode
  after_validation :geocode

  validates :name, presence: true
  validates :description, presence: true
  validate :validate_contacts

  def validate_contacts
    if phone.blank? && email.blank? && url.blank?
      errors.add(:base, "Phone, contact email and website URL can't all be blank")
    end
  end

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
