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
        if @company.update(company_params)
            flash[:success] = "Company Updated"
            redirect_to company_path(@company)
        else
            render 'edit'
        end
    end

    def destroy
        if @company.destroy
          flash[:success] = "Company deleted"
          redirect_to companies_path
        end
      end
        

    private
    def company_params
        params.require(:company).permit(:name, :email, :phone_number, :branch)
    end

    def current_company
        @company = Company.find(params[:id])
    end
end
