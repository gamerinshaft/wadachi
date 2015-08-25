# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(uid: "5210293", email: "j.tane3ma@gmail.com", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 06:44:57", last_sign_in_at: "2015-08-22 06:13:15", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", created_at: "2015-08-22 06:12:22", updated_at: "2015-08-22 06:44:57", provider: "github", uid: "5210293", github_token: "724f58a17dfc083c17b568b2af43919c12e57dc0", avatar_url: "https://avatars.githubusercontent.com/u/5210293?v=3", nickname: "gamerinshaft", name: "j.taneichi")
profile = Profile.create(bio: "ほげほげほげ", user_id: nil)
flag = Flag.create()
notification = Notification.create()
user.profile = profile
user.flag = flag
user.notification = notification
user = User.create(id: "6434708", email: "limestreem@gmail.com", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-08-25 20:34:40", last_sign_in_at: "2015-08-25 20:34:40", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", created_at: "2015-08-25 20:34:40", updated_at: "2015-08-25 20:34:40", provider: "github", uid: "6434708", github_token: "e10be818909abc40073099c553ea713183352d22", avatar_url: "https://avatars.githubusercontent.com/u/6434708?v=3", nickname: "LimeStreem", name: "ライム野郎")
profile = Profile.create(bio: "いしいです", user_id: nil)
flag = Flag.create()
notification = Notification.create()
user.profile = profile
user.flag = flag
user.notification = notification