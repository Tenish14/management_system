class CompaniesController < ApplicationController
    before_action :current_company, only: [:show, :edit, :update, :destroy]
    
    def index
        @companies = Company.all
    end

    def show
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            flash[:success] = "New company created"
            redirect_to company_path(@company)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if company_params[:name] != nil
            @company.update(company_params)
            flash[:warning] = "Company Updated"
            redirect_to company_path(@company)
        elsif company_params[:name] == nil
            location_id = params[:location][:id]
            location_code = params[:location][:location_code]
            location_name = params[:location][:name]
            location_address1 = params[:location][:address_1]
            location_address2 = params[:location][:address_2]
            location_postcode = params[:location][:postcode]
            location_state = params[:location][:state]
            location_country = params[:location][:country]
            location_company = params[:location][:company_id]
            location = Location.find(location_id)
            location.update(location_code: location_code, name: location_name, address_1: location_address1, address_2: location_address2, postcode: location_postcode, state: location_state, country: location_country, company_id: location_company)
            flash[:warning] = "Company Location Updated"
            redirect_to company_path(@company)
        else
            render 'edit'
        end
    end

    def destroy
        if @company.destroy
          flash[:danger] = "Company deleted"
          redirect_to companies_path
        end
      end
        

    private
    def company_params
        params.require(:company).permit(:name, :email, :phone_number, :branch, :location => [id: [], location_code: [], name: [], address_1: [], address_2: [], postcode: [], state: [], country: [], company_id: []])
    end

    def current_company
        @company = Company.find(params[:id])
    end
end
