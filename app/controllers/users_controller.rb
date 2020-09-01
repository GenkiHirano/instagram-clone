class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = current_user
  end

  def edit
    # 編集するユーザーが本人じゃない場合はユーザーページにリダイレクトする
    unless @user == current_user
      #binding.pry
      redirect_to user_path(@user)
    end
  end

  def update
    binding.pry
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {}).permit(:username)
    end
end
