class Category < ApplicationRecord
    has_and_belongs_to_many :services

    def display_resource(category)
        category.name
    end
end
