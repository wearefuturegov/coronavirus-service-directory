class ServicesController < ApplicationController

    def index
        @services = Service.page(params[:page])
        @services = @services.joins(:categories).where("categories.name in (?)", params[:category]) if params[:category].present?
        if params[:postcode].present?
            @locations = Geocoder.search(params[:postcode], region: "gb")
            @services = @services.near(@locations.first.coordinates, 200) if @locations.present?
            flash[:alert] = "Couldn't find any services near that location. Is it a valid postcode or area in Camden?" if @services.empty? || @locations.blank?
        end
        respond_to do |format|
            format.html
            format.json { render json: @services }
        end
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