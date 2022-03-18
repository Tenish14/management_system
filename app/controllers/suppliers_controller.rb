class SuppliersController < ApplicationController
    
    def index
        @suppliers = Supplier.all
    end

    def new
        @supplier = Supplier.new
    end

    def show
      @supplier = Supplier.find(params[:id])
    end

    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
          params[:items_ids].each do |item_id|
            @supplier_item = SupplierItem.new(item_id: item_id, supplier_id: @supplier.id)
            @supplier_item.save
          end
          flash[:success] = "New supplier created"
          redirect_to suppliers_path
        else
          render 'new'
        end
      end
    
      private
        def supplier_params
          params.require(:supplier).permit(:first_name, :last_name, :username, 
                                       :email, :phone_number, :company_id, item_ids: [], location_ids: [])
        end

end
