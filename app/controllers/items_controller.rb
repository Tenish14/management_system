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
      params[:location_item][:location_ids].each do |location_id|
        outlet_prices = params[:location_item][:outlet_prices]
        outlet_costs = params[:location_item][:outlet_costs]
        outlet_profits = params[:location_item][:outlet_profits]
        # binding.pry
        @location_item = LocationItem.new(location_id: location_id, item_id: @item.id, outlet_price: outlet_prices["#{location_id}"][0].to_i, outlet_cost:outlet_costs["#{location_id}"][0].to_i, outlet_profit: outlet_profits["#{location_id}"][0].to_i)
        @location_item.save
      end 
      flash[:success] = "New item created"
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      params[:location_item][:location_ids].each do |location_id|
        outlet_prices = params[:location_item][:outlet_prices]
        outlet_costs = params[:location_item][:outlet_costs]
        outlet_profits = params[:location_item][:outlet_profits]
        # binding.pry
        @location_item = LocationItem.update(location_id: location_id, item_id: @item.id, outlet_price: outlet_prices["#{location_id}"][0].to_i, outlet_cost:outlet_costs["#{location_id}"][0].to_i, outlet_profit: outlet_profits["#{location_id}"][0].to_i)
      end 
      flash[:success] = "Items updated"
      redirect_to item_path(@item)
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
                                   :price, :cost, :profit, :category_id, :company_id, :item_code, :location_item => [outlet_costs: [], outlet_prices: [], outlet_profits: [], location_ids:[]])
    end

    def current_item
      @item = Item.find(params[:id])
    end

   
end
