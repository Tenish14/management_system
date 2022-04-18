class LocationsController < ApplicationController
    before_action :current_location, only: [:show, :edit, :update, :destroy]

    def index
        @locations = Location.all
    end

    def new 
        @location = Location.new
    end

    def show
      end

    def create
        @location = Location.new(location_params)
        if @location.save
            flash[:success] = "New location created"
            redirect_to location_path(@location)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @location.update(location_params)
            flash[:warning] = "Location Updated"
            redirect_to location_path(@location)
        end
    end
    
    def destroy
        if @location.destroy
            flash[:danger] = "Location Deleted"
            redirect_to locations_path
        end
    end

    private
        def location_params
            params.require(:location).permit(:name, :address_1, :address_2, 
                                             :postcode, :state, :country, :company_id, :location_code)
        end

        def current_location
            @location = Location.find(params[:id])
        end
end
