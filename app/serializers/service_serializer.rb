class ServiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, 
    :description,
    :how_to_contact,
    :phone,
    :email,
    :url,
    :street_address,
    :postcode,
    :longitude,
    :latitude,
    :key_point_1,
    :key_point_2,
    :key_point_3,
    :recommended

  has_many :categories
end
