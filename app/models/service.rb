class Service < ApplicationRecord
  geocoded_by :postcode
  after_validation :geocode

  def rough_distance
      if distance < 1
        "Less than a mile away"
      elsif (1 < distance) && (distance < 2)
        "About a mile away"
      else
        "About #{distance.round} miles away"
      end
  end

  def self.categories
    [
      ["Groceries and cooked meals", "food"],
      ["Dog walking", "dogs"],
      ["Prescription pickups", "prescriptions"],
      ["Staying social", "social"],
      ["Book drops and entertainment", "entertainment"],
      ["Physical and mental wellbeing", "wellbeing"]
    ]
  end

end
