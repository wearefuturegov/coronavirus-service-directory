class ServicesController < ApplicationController

    def search
        @categories = Service.categories
    end

    def index
        results = Geocoder.search(params[:postcode], region: "gb")
        @services = Service
            .where("category && ARRAY[?]::varchar[]", params[:categories])
            .near(results.first.coordinates, 200)
    end

end