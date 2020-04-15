class ServicesController < ApplicationController

    def index
        @services = Service.page(params[:page]).joins(:categories).preload(:categories)
        if params[:postcode].present?
            @locations = Geocoder.search(params[:postcode], region: "gb")
            @services = @services.near(@locations.first.coordinates, 200) if @locations.present?
            flash[:alert] = "Couldn't find any services near that location. Is it a valid postcode or area in Camden?" if @services.empty? || @locations.blank?
        end
        @services = @services.joins(:categories).where("categories.name in (?)", params[:category]) if params[:category].present?
        respond_to do |format|
            format.html
            format.json { render json: ServiceSerializer.new(@services).serializable_hash }
        end
    end

    def new
        @new_service = Service.new
    end

    def create
        @new_service = Service.new(service_params)
        @new_service.attribution = "Public submission"
        if @new_service.save
            ServiceMailer.with(service: @new_service).new_submission.deliver_later
            redirect_to root_path, notice: "Your service has been submitted successfully. We'll be in touch if we need anything more from you."
        else
            render :new
        end
    end

    private

    def service_params
        params.require(:service).permit(
            :name, 
            :description,
            :phone,
            :url,
            :email,
            :street_address,
            :postcode,
            :caretaker_email,
            :caretaker_phone,
            category_ids: []
        )
    end

end