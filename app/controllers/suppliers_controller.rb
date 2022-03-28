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
        params[:items_ids].each do |item_id|
          @supplier_item = SupplierItem.new(item_id: item_id, supplier_id: @supplier.id)
          @supplier_item.save
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
                                       :email, :phone_number, :company_id, item_ids: [], location_ids: [])
      end

      def current_supplier
        @supplier = Supplier.find(params[:id])
      end

end
