class ServicesController < ApplicationController

    def search
        @categories = [
            ["Food", "food"],
            ["Dog walking", "dogs"],
            ["Prescription pickups", "prescriptions"],
        ]
        # byebug
    end

    def index
        @services = Service.all
    end

end