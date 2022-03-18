class ItemsController < ApplicationController

    def index
        @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end
    
    def new 
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        # binding.pry
        if @item.save
          params[:location_ids].each do |location_id|
            @location_item = LocationItem.new(location_id: location_id, item_id: @item.id)
            @location_item.save
          end
          flash[:success] = "New item created"
          redirect_to items_path
        else
          render 'new'
        end
    end
    
    private
        def item_params
          params.require(:item).permit(:name, :description, :quantity_stock, 
                                       :price, :category_id, :company_id, location_ids: [])
        end

end
