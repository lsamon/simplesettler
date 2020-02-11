# frozen_string_literal: true

User.destroy_all

users = [
  { username: 'admin', email: 'admin@gmail.com', password: '12345678', kind: :admin },
  { username: 'joel', email: 'joel@gmail.com', password: '12345678', kind: :client  },
  { username: 'luke', email: 'luke@gmail.com', password: '12345678', kind: :client  },
  { username: 'shaila', email: 'shaila@gmail.com', password: '12345678', kind: :client  }
]
users.each do |user_attrs|
  User.create user_attrs
end

Category.destroy_all

getting_started = Category.create name: 'Getting started'
getting_started.articles.create(
  title: 'Student Guide: Which bank should I sign up with in Australia',
  content: 'Lorem ispum'
)
things_to_do = Category.create name: 'Things to do'
things_to_do.articles.create(
  title: 'Three ways investors and entrepreneurs cna move to Australia',
  content: 'Lorem ispum'
)
get_settled = Category.create name: 'Getting settled'
get_settled.articles.create(
  title: 'Which city is right for you?',
  content: 'Lorem ispum'
)

City.destroy_all
cities = %w[Sydney Melbourne Brisbane]

cities.each do |city|
  City.create name: city, country: 'Australia', description: 'lorem ipsum'
end
