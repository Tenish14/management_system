class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New user created"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = "User deleted"
        redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, 
                                   :email, :password, :password_confirmation, :role_id, :company_id)
    end

end
