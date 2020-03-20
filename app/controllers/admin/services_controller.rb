class Admin::ServicesController < ApplicationController
  before_action :set_admin_service, only: [:show, :edit, :update, :destroy]

  # GET /admin/services
  # GET /admin/services.json
  def index
    @admin_services = Service.all
    # byebug
  end

  # GET /admin/services/1
  # GET /admin/services/1.json
  def show
  end

  # GET /admin/services/new
  def new
    @admin_service = Service.new
  end

  # GET /admin/services/1/edit
  def edit
  end

  # POST /admin/services
  # POST /admin/services.json
  def create
    @admin_service = Service.new(admin_service_params)

    respond_to do |format|
      if @admin_service.save
        format.html { redirect_to @admin_service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @admin_service }
      else
        format.html { render :new }
        format.json { render json: @admin_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/services/1
  # PATCH/PUT /admin/services/1.json
  def update
    respond_to do |format|
      if @admin_service.update(admin_service_params)
        format.html { redirect_to @admin_service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_service }
      else
        format.html { render :edit }
        format.json { render json: @admin_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/services/1
  # DELETE /admin/services/1.json
  def destroy
    @admin_service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_service
      @admin_service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_service_params
      params.fetch(:admin_service, {})
    end
end
