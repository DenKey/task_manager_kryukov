User.create!(email: "admin@example.com", password: "zero21nmu", admin: true)


(1..5).each do |num|
  user = User.create!(email: "user#{num}@example.com", password: "12345678")
  list = user.list.create(title: "User#{num} List ")
  list.todo.create(content: "Just Do it")
end

