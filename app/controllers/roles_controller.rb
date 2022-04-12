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
        # binding.pry
        if @role.save
            params[:role_permission][:permission_ids].each do |permission_id|
                role_permission = RolePermission.new(permission_id: permission_id, role_id: @role.id)
                role_permission.save
            end
            flash[:success] = "New role created"
            redirect_to roles_path
        else
            render 'new'
        end
    end

    def edit
    end4

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
            params.require(:role).permit(:name, :description, :role_permission => [permission_ids: []])
        end

        def current_role
            @role = Role.find(params[:id])
        end
end
