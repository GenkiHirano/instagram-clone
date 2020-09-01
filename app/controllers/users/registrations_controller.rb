class Users::RegistrationsController < Devise::RegistrationsController

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
