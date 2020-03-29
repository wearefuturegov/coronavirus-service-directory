class ServicesController < ApplicationController

    def index

        # byebug

        locations = Geocoder.search(params[:postcode], region: "gb") if params[:postcode]
        @services = Service.all
        @services = @services.near(locations.first.coordinates, 200) if locations && locations.length > 0
        
        @services = @services.joins(:categories).where("categories.name in (?)", params[:categories]) if params[:categories]
    end

    def new
        @new_service = Service.new
    end

    def create
        @new_service = Service.new(service_params)
        if @new_service.save
            render :success
        else
            render :new
        end
    end

    private

    def service_params
        params.require(:service).permit(:name, :description)
    end

end