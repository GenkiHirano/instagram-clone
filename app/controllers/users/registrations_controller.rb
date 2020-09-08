class Users::RegistrationsController < Devise::RegistrationsController

  def edit
    super
    unless @user == current_user
      redirect_to user_path(@user)
    end
    #binding.pry
  end

  def update
    super
    #binding.pry
  end

  protected

  #編集ページでPWを入れずにユーザー情報を編集できるようにする
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
