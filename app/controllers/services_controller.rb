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
        @services = Service.where("category && ARRAY[?]::varchar[]", params[:categories])
        # byebug
    end

end