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
    
    def rough_distance(distance)
        if distance < 1
          "Less than a mile away"
        elsif (1 < distance) && (distance < 2)
          "About a mile away"
        else
          "About #{distance.round} miles away"
        end
    end
end
