class LocationsController < ApplicationController
    before_action :current_location, only: [:show, :edit, :update, :destroy]

    def index
        @locations = Location.all
    end
    
    def show
    end

    def new 
        @location = Location.new
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
        # binding.pry
        item_id = params[:item][:id]
        item_name = params[:item][:name]
        item_code = params[:item][:code]
        item_description = params[:item][:description]
        item_quantity = params[:item][:quantity]
        item_price = params[:item][:price]
        item_cost = params[:item][:cost]
        item_profit = params[:item][:profit]
        item_category = params[:item][:category]
        item_outlet_price = params[:item][:outlet_price]
        item_outlet_cost = params[:item][:outlet_cost]
        item_outlet_profit = params[:item][:outlet_profit]
        item = Item.find(item_id)
        item.update(name: item_name, description: item_description, quantity_stock: item_quantity, price: item_price, cost: item_cost, profit: item_profit, item_code: item_code, category_id: item_category)
        location_item = LocationItem.where(item_id: item_id).first
        location_item.update(outlet_price: item_outlet_price, outlet_cost: item_outlet_cost, outlet_profit: item_outlet_profit)
        flash[:warning] = "Location Updated"
        redirect_to location_path(@location)
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
                                             :postcode, :state, :country, :company_id, :location_code, :item => [:id, :code, :name, :description, :quantity, :price, :cost, :profit, :category, :outlet_price, :outlet_cost, :outlet_profit])
        end

        def current_location
            @location = Location.find(params[:id])
        end
end
