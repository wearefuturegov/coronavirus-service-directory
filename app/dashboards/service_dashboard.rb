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
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone: Field::String,
    latitude: Field::String.with_options(searchable: false),
    longitude: Field::String.with_options(searchable: false),
    postcode: Field::String,
    key_point_1: Field::String,
    key_point_2: Field::String,
    key_point_3: Field::String,
    recommended: Field::Boolean,
    how_to_contact: Field::String,
    email: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  name
  description
  url
  published
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  name
  description
  categories
  published
  url
  phone
  email
  latitude
  longitude
  postcode
  key_point_1
  key_point_2
  key_point_3
  recommended
  how_to_contact
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  categories
  name
  published
  description
  url
  phone
  latitude
  longitude
  postcode
  key_point_1
  key_point_2
  key_point_3
  recommended
  how_to_contact
  email
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
