class SuppliersController < ApplicationController
    
    def index
        @suppliers = Supplier.all
    end

    def new
        @supplier = Supplier.new
    end

    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
          flash[:success] = "New supplier created"
          redirect_to suppliers_path
        else
          render 'new'
        end
      end
    
      private
        def supplier_params
          params.require(:supplier).permit(:first_name, :last_name, :username, 
                                       :email, :phone_number)
        end

end
