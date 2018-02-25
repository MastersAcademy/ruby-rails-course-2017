class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :destroy]
  def index
    @user = User.all
  end

  def show
    @User = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
       flash[:notice] = 'User was created!'
       redirect_to root_path
     else
       flash[:error] = 'Failed!'
       render :new
     end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    if @user.delete
      flash[:notice] = 'User was deleted!'
       redirect_to root_path
    else
      flash[:error] = 'Failed to delete this user!'
      render :destroy
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
