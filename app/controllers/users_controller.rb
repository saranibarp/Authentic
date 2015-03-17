class UsersController < ApplicationController
  before_action :lookup_user, only: [:edit, :update, :destroy]
  
  def index
    if current_user.is_admin?
      @users = User.order('name ASC')
    else
      redirect_to root_path, notice: "Access denied!"  
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to sessions_path, notice: "Thank you! You're one of us now"
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to edit_user_path(@user), notice: "Profile updated!"
    else
      render :edit
    end
  end

  def destroy
    if current_user.is_admin?
      @user.destroy
      redirect_to users_path
    else
      redirect_to root_path, notice: "Access denied!"  
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def lookup_user
    @user = User.find(params[:id])
  end
end