class ServicesController < ApplicationController

    def index
        locations = Geocoder.search(params[:postcode], region: "gb") if params[:postcode]
        
        @services = Service.all.page(params[:page])
        @services = @services.near(locations.first.coordinates, 200) if locations && locations.length > 0
        @services = @services.joins(:categories).where("categories.name in (?)", params[:category]) if params[:category]
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