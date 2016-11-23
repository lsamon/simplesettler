User.destroy_all

u1 = User.create :username => 'admin', :email => 'admin@gmail.com', :password => 'chicken', :admin => true
u2 = User.create :username => 'joel', :email => 'joel@gmail.com', :password => 'chicken'
u3 = User.create :username => 'luke', :email => 'luke@gmail.com', :password => 'chicken'
u4 = User.create :username => 'shaila', :email => 'shaila@gmail.com', :password => 'chicken'


Article.destroy_all

a1 = Article.create :title => 'Student Guide: Which bank should I sign up with in Australia', :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

a2 = Article.create :title => 'Three ways investors and entrepreneurs cna move to Australia', :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

a3 = Article.create :title => 'Which city is right for you?', :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'


City.destroy_all

c1 = City.create :name => 'Sydney', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c2 = City.create :name => 'Melbourne', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c3 = City.create :name => 'Brisbane', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c4 = City.create :name => 'Adelaide', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c5 = City.create :name => 'Perth', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c6 = City.create :name => 'Canberra', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''


Helpful.destroy_all

h1 = Helpful.create :helped => true
h2 = Helpful.create :helped => true
h3 = Helpful.create :helped => true
h4 = Helpful.create :helped => false
h5 = Helpful.create :helped => true
h6 = Helpful.create :helped => false


Feedback.destroy_all

f1 = Feedback.create :liveability => 4, :safety => 3, :movability => 1, :weather => 5
f2 = Feedback.create :liveability => 2, :safety => 2, :movability => 3, :weather => 4
f3 = Feedback.create :liveability => 4, :safety => 2, :movability => 2, :weather => 3
f4 = Feedback.create :liveability => 5, :safety => 4, :movability => 3, :weather => 3


Category.destroy_all

ca1 = Category.create :name => 'Getting started'
ca2 = Category.create :name => 'Things to do'
ca3 = Category.create :name => 'Getting settled'


u1.articles << a1
u1.articles << a2
u1.articles << a3

u1.save

c1.articles << a1
c1.articles << a2
c2.articles << a3

c1.save
c2.save

h1.user = u1
h2.user = u1
h3.user = u2
h4.user = u2
h5.user = u3
h6.user = u4

h1.article = a1
h2.article = a2
h3.article = a1
h4.article = a3
h5.article = a1
h6.article = a2

h1.save
h2.save
h3.save
h4.save
h5.save
h6.save


f1.user = u1
f2.user = u1
f3.user = u2
f4.user = u3

f1.city = c1
f2.city = c2
f3.city = c1
f4.city = c3

f1.save
f2.save
f3.save
f4.save

a1.categories << ca1
a2.categories << ca2
a3.categories << ca3

a1.save
a2.save
a3.save
