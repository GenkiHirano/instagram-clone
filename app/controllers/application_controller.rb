class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?


  #ユーザー登録後のリダイレクト先を個人ページに設定する
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  protected

    def configure_permitted_parameters
      #各カラムを配列にまとめる
      added_attrs = [ :email, :fullname, :username, :password, :password_confirmation ]
      # サインアップ時にnameのストロングパラメータを追加
      #devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      #devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :username, :email, :profile])
    end
end
