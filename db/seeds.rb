5.times do |n|
  User.create!(
    name: "てすと#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: "test#{n + 1}"
  )
end
