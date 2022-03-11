class ItemsController < ApplicationController

    def index
        @items = Item.all
    end
    
    def new 
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
          flash[:success] = "New item created"
          redirect_to items_path
        else
          render 'new'
        end
    end
    
    private
        def item_params
          params.require(:item).permit(:name, :description, :quantity_stock, 
                                       :price, :category_id, :company_id)
        end
end
