class Category < ApplicationRecord
    has_and_belongs_to_many :services

    validates :name, presence: true

    def label
        long_name || name.humanize
    end
end
