class LocationsController < ApplicationController

    def index
        @locations = Location.all
    end

    def new 
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        if @location.save
            flash[:success] = "New location created"
            redirect_to locations_path
        else
            render 'new'
        end
    end

    private
        def location_params
            params.require(:location).permit(:name, :address_1, :address_2, 
                                             :postcode, :state, :country)
        end
end
