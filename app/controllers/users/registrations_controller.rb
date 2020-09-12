class Users::RegistrationsController < Devise::RegistrationsController

  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    super
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    super
  end

  protected

  #編集ページでPWを入れずにユーザー情報を編集できるようにする
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
