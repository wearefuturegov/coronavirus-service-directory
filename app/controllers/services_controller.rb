class ServicesController < ApplicationController

    def index

        @categories = Service.categories
        results = Geocoder.search(params[:postcode], region: "gb")

        if results.length > 0
            @top_result = Service
                .where("recommended = TRUE AND category && ARRAY[?]::varchar[]", params[:categories])
                .limit(1)

            @result = results.first.formatted_address
            @coordinates = Geocoder.coordinates(params[:postcode])

            if params[:categories]
                @services = Service
                    .where("category && ARRAY[?]::varchar[]", params[:categories])
                    .near(results.first.coordinates, 200)
            else
                @services = Service
                    .near(results.first.coordinates, 200)
            end
        else
            @services = Service.all
        end
    end 

end