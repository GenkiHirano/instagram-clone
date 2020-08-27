class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
    # 編集するユーザーが本人じゃない場合はユーザーページにリダイレクトする
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    #アップデートが上手くいけばマイページに戻る
    #失敗した場合は、もう一度編集ページを表示する
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:username)
  end

end
