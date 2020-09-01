# メインのサンプルユーザーを1人作成する
User.create!(fullname:  "Example User",
             username:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 追加のユーザーをまとめて生成する
#99.times do
  #User.create!(
    #fullname: Faker::Name.fullname,
    #username: Faker::Name.username,
    #email: Faker::Internet.email,
    #password: '12345678',
    #password_confirmation: '12345678'
#)s s
#end

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(fullname:  name,
               username:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
