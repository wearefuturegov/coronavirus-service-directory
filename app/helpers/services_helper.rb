module ServicesHelper
    def location_summary(locations)
        locations
            .first
            .formatted_address
            .delete_suffix(", UK")
            .delete_suffix(", London")
    end

    def is_initial?
        params[:postcode].blank? && params[:category].blank? && params[:page].blank?
    end
end
