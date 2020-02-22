# frozen_string_literal: true

User.destroy_all

users = [
  { username: 'admin', email: 'admin@gmail.com', password: '12345678', kind: :admin },
  { username: 'joel', email: 'joel@gmail.com', password: '12345678', kind: :client  },
  { username: 'luke', email: 'luke@gmail.com', password: '12345678', kind: :client  },
  { username: 'shaila', email: 'shaila@gmail.com', password: '12345678', kind: :client },
]
users.each do |user_attrs|
  User.create(user_attrs)
end

City.destroy_all
cities = %w[Sydney Melbourne Brisbane]

cities.each do |city|
  City.create(name: city, country: 'Australia', description: 'lorem ipsum')
end
