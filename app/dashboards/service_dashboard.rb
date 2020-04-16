require "administrate/base_dashboard"

class ServiceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    categories: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    published: Field::Boolean,
    description: Field::Text,
    how_to_contact: Field::String,
    url: Field::String,
    phone: Field::String,
    email: Field::String,
    street_address: Field::String,
    postcode: Field::String,
    latitude: Field::String.with_options(searchable: false),
    longitude: Field::String.with_options(searchable: false),
    key_point_1: Field::String,
    key_point_2: Field::String,
    key_point_3: Field::String,
    recommended: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    attribution: Field::String,
    caretaker_email: Field::String,
    caretaker_phone: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    url
    published
    updated_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  name
  description
  how_to_contact
  categories
  published
  url
  phone
  email
  street_address
  postcode
  latitude
  longitude
  key_point_1
  key_point_2
  key_point_3
  recommended
  created_at
  updated_at
  attribution
  caretaker_email
  caretaker_phone
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    how_to_contact
    categories
    published
    url
    phone
    email
    street_address
    postcode
    latitude
    longitude
    key_point_1
    key_point_2
    key_point_3
    recommended
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how services are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(service)
  #   "Service ##{service.id}"
  # end

  def display_resource(service)
    service.name
  end

end
