class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_user,           only: [:show, :edit, :update]
  before_action :admin_user,         only: [:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = current_user
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  #def update
    #binding.pry
    #if @user.update(user_params)
      #redirect_to user_path(current_user)
    #else
      #redirect_to edit_user_registration_path(current_user)
    #end
  #end

  def destroy
    #binding.pry
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def set_user
      @user = User.find(params[:id])
      #binding.pry
    end

    def user_params
      params.fetch(:user, {}).permit(:username)
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      #binding.pry
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
