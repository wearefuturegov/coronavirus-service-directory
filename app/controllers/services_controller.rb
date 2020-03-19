class ServicesController < ApplicationController

    def search
        @categories = [
            ["Groceries and cooked meals", "food"],
            ["Dog walking", "dogs"],
            ["Prescription pickups", "prescriptions"],
            ["Staying social", "social"],
            ["Book drops and entertainment", "entertainment"]
        ]
        # byebug
    end

    def index
        byebug
        @services = Service.where()
    end

end