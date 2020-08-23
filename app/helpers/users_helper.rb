module UsersHelper

  # 引数で与えられたユーザーのGravatar画像を返す
 def gravatar_for(user)
   gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
   image_tag(gravatar_url, alt: user.name, class: "gravatar")
 end

 # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
end
