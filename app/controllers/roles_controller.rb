class RolesController < ApplicationController

    def index
        @role = Role.all
    end

    def new
        @role = Role.new
    end

    def create
        @role = Role.new(role_params)
        if @role.save
            flash[:success] = "New role created"
            redirect_to roles_path
        else
            render 'new'
        end
    end

    private
        def role_params
            params.require(:role).permit(:name, :description)
        end
end
