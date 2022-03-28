class ItemsController < ApplicationController
  before_action :current_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end
    
  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # params[:location_item].each do |i|
        # binding.pry
        # @location_item = LocationItem.new(location_id: i.location_id, item_id: @item.id, outlet_price: i.outlet_price, outlet_cost:i.outlet_cost, outlet_profit: i.outlet_profit)
        # @location_item.save
      # end 
      flash[:success] = "New item created"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      # @location_item = LocationItem.find(params[:id])
      # @location_item = LocationItem.update(location_id: location_id, item_id: @item.id, price: @item.outlet_price, cost: @item.cost, profit: @item.profit)
      flash[:success] = "Items updated"
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      flash[:success] = "Item deleted"
      redirect_to items_path
    end
  end
    
  private
    def item_params
      params.require(:item).permit(:name, :description, :quantity_stock, 
                                   :price, :cost, :profit, :category_id, :company_id, :location_item => [outlet_costs: [], outlet_prices: [], outlet_profits: [], location_ids:[]])
    end

    def current_item
      @item = Item.find(params[:id])
    end

   
end
