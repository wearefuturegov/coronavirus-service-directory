class ServicesController < ApplicationController

    def search
        @categories = Service.categories
    end

    def index
        results = Geocoder.search(params[:postcode], region: "gb")

        if results.length > 0
            @top_result = Service
                .where("recommended = TRUE AND category && ARRAY[?]::varchar[]", params[:categories])
                .limit(1)

            @result = results.first.formatted_address
            @coordinates = Geocoder.coordinates(params[:postcode])

            if @top_result.length > 0
                if params[:categories]
                    @services = Service
                        .where("category && ARRAY[?]::varchar[] AND id != ?", params[:categories], @top_result[0].id)
                        .near(results.first.coordinates, 200)
                else
                    @services = Service
                        .where("id != ?", @top_result[0].id)
                        .near(results.first.coordinates, 200)
                end
            else
                if params[:categories]
                    @services = Service
                        .where("category && ARRAY[?]::varchar[]", params[:categories])
                        .near(results.first.coordinates, 200)
                else
                    @services = Service
                        .near(results.first.coordinates, 200)
                end
            end
        else
            redirect_to search_services_path, :notice => "Couldn't find any services near that location. Please make sure your location is a valid Camden area."
        end
    end 

end