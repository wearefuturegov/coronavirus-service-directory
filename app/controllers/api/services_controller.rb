class Api::ServicesController < ApplicationController
    def index
        @services = Service.published
        render json: ServiceSerializer.new(@services).serialized_json
    end

    def show
        @service = Service.published.find(params[:id])
        render json: ServiceSerializer.new(@service).serialized_json
    end
end