class ServicesController < ApplicationController

    def search
        @categories = Service.categories
    end

    def index
        @services = Service
            .where("category && ARRAY[?]::varchar[]", params[:categories])
            .near(params[:postcode], 200)
        # byebug
    end

end