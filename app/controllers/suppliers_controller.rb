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
      binding.pry
      if @supplier.save
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
    if @supplier.update(supplier_params)
      flash[:success] = "Supplier Update"
      redirect_to supplier_path(@supplier)
    else
      render 'edit'
    end
  end

  def destroy
    if @supplier.destroy
      flash[:success] = "Supplier Deleted"
      redirect_to suppliers_path
    end
  end
    
    private
      def supplier_params
        params.require(:supplier).permit(:first_name, :last_name, :username, 
                                       :email, :phone_number, :company_id, :supplier_item => [item_ids: [], location_ids: [], supplier_prices:[]])
      end

      def current_supplier
        @supplier = Supplier.find(params[:id])
      end

end
