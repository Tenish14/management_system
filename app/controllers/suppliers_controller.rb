class SuppliersController < ApplicationController
  before_action :current_supplier, only: [:show, :edit, :update, :destroy]
    
  def index
      @suppliers = Supplier.all
  end

  def new
      @supplier = Supplier.new
  end

  def show
  end

  def create
    @supplier = Supplier.new(supplier_params)
      if @supplier.save

        item_code = params[:supplier_item][:item_ids]
        item_id  = Item.where(:item_code => item_code).pluck(:id)
        item_code.replace(item_id)

        location_code = params[:supplier_item][:location_ids]
        location_id = Location.where(:location_code => location_code).pluck(:id)
        location_code.replace(location_id)

        item_params = params.require(:supplier_item).permit(item_ids: [], location_ids:[], supplier_prices: [])
        items = item_params[:item_ids].zip(*item_params.values_at(:location_ids, :supplier_prices))
        items.map do |item_id, location_id, supplier_price|
          supplier_item = SupplierItem.new({
            item_id: item_id,
            location_id: location_id,
            supplier_price: supplier_price,
            supplier_id: @supplier.id
          })
          supplier_item.save
        end
        flash[:success] = "New supplier created"
        redirect_to supplier_path(@supplier)
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    # binding.pry
    if supplier_params[:username] != nil
      @supplier.update(supplier_params)
      item_code = params[:supplier_item][:item_ids]
      item_id  = Item.where(:item_code => item_code).pluck(:id)
      item_code.replace(item_id)

      location_code = params[:supplier_item][:location_ids]
      location_id = Location.where(:location_code => location_code).pluck(:id)
      location_code.replace(location_id)

      item_params = params.require(:supplier_item).permit(item_ids: [], location_ids:[], supplier_prices: [])
      items = item_params[:item_ids].zip(*item_params.values_at(:location_ids, :supplier_prices))
      items.map do |item_id, location_id, supplier_price|
        supplier_item = SupplierItem.update({
          item_id: item_id,
          location_id: location_id,
          supplier_price: supplier_price,
          supplier_id: @supplier.id
        })
      end
    flash[:warning] = "Supplier updated"
    redirect_to supplier_path(@supplier)
    elsif supplier_params[:username] == nil
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
      item_supplier_price = params[:item][:supplier_price]
      item_location_id = params[:item][:location_id]
      
      location_id = Location.where(:location_code => item_location_id).pluck(:id).first
      location_id.to_i

      item = Item.find(item_id)
      item.update(name: item_name, description: item_description, quantity_stock: item_quantity, price: item_price, cost: item_cost, profit: item_profit, item_code: item_code, category_id: item_category)

      supplier_item = SupplierItem.where(item_id: item_id)
      supplier_item.update(supplier_price: item_supplier_price, location_id: location_id)

      flash[:warning] = "Supplier Item Updated"
      redirect_to supplier_path(@supplier)
    else
      render 'edit'
    end
  end

  def destroy
    if @supplier.destroy
      flash[:danger] = "Supplier Deleted"
      redirect_to suppliers_path
    end
  end
    
    private
      def supplier_params
        params.require(:supplier).permit(:first_name, :last_name, :username, 
                                       :email, :phone_number, :company_id, :supplier_item => [item_ids: [], location_ids: [], supplier_prices:[]], :item => [:company_id, :id, :name, :description, :quantity, :price, :cost, :profit, :category, :location_id, :supplier_price])
      end

      def current_supplier
        @supplier = Supplier.find(params[:id])
      end

end
