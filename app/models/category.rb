class Category < ApplicationRecord
    has_and_belongs_to_many :services

    def label
        self.name
    end
end
