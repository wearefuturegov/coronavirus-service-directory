class Service < ApplicationRecord
  has_and_belongs_to_many :categories

  geocoded_by :postcode
  after_validation :geocode

  paginates_per 12

  validates :name, presence: true
  validates :description, presence: true
  validate :validate_contacts
  validate :validate_caretaker

  scope :published, -> { where(published: true) } 
  scope :category, -> (category) { where("categories.name in (?)", category)}
  scope :kinda_near, -> (coordinates) { near(coordinates, 200)}

  def validate_contacts
    if phone.blank? && email.blank? && url.blank?
      errors.add(:base, "You need to give at least one way for the public to contact this service")
    end
  end

  def validate_caretaker
    if attribution === "Public submission" && caretaker_email.blank? && caretaker_phone.blank?
      errors.add(:base, "You need to give either a phone or an email address so we can contact you")
    end
  end

end
