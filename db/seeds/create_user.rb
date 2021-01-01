10.times do |i|

  User.create(
    email: "123#{i}@email.com",
    password: Devise.friendly_token[0, 20]
  )

end

