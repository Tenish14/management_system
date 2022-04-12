class RolesController < ApplicationController
    before_action :current_role, only: [:edit, :update, :destroy]

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

    def edit
    end

    def update
        if @role.update(role_params)
            flash[:success] = "Role Updated"
            redirect_to roles_path
        else
            render 'edit'
        end
    end

    def destroy
        if @role.destroy
            flash[:success] = "Role destroyed"
            redirect_to roles_path
        end
    end

    private
        def role_params
            params.require(:role).permit(:name, :description)
        endf

        def current_role
            @role = Role.find(params[:id])
        end
end
