class RolesController < ApplicationController

    def index
    end

    def new
        @role = Role.new
    end
end
