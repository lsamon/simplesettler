User.destroy_all

u1 = User.create :username => 'admin', :email => 'admin@gmail.com', :password => 'chicken', :admin => true
u2 = User.create :username => 'joel', :email => 'joel@gmail.com', :password => 'chicken'
u3 = User.create :username => 'luke', :email => 'luke@gmail.com', :password => 'chicken'
u4 = User.create :username => 'shaila', :email => 'shaila@gmail.com', :password => 'chicken'

Category.destroy_all

ca1 = Category.create :name => 'Getting started'
ca2 = Category.create :name => 'Things to do'
ca3 = Category.create :name => 'Getting settled'


City.destroy_all

c1 = City.create :name => 'Sydney', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c2 = City.create :name => 'Melbourne', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c3 = City.create :name => 'Brisbane', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c4 = City.create :name => 'Adelaide', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c5 = City.create :name => 'Perth', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''

c6 = City.create :name => 'Canberra', :country => 'Australia', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', :population => ''


Article.destroy_all

a1 = Article.create :title => 'Student Guide: Which bank should I sign up with in Australia', :category_id => ca1.id, :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

a2 = Article.create :title => 'Three ways investors and entrepreneurs cna move to Australia', :category_id => ca2.id, :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

a3 = Article.create :title => 'Which city is right for you?', :category_id => ca3.id, :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'


VisaType.destroy_all
v1 = VisaType.create :name=>'Work Visa', :description=>''
v2 = VisaType.create :name=>'Student Visa', :description=>''
v3 = VisaType.create :name=>'Extend Visa', :description=>''
v4 = VisaType.create :name=>'Temporary Residency', :description=>''
v5 = VisaType.create :name=>'Permanent Residency', :description=>''
v6 = VisaType.create :name=>'Citizenship', :description=>''
v7 = VisaType.create :name=>'Other', :description=>''

VisaRequirement.destroy_all
r1 = VisaRequirement.create :description=>'Be atleast 18+ years old'
r2 = VisaRequirement.create :description=>'Lived in sydney for 2 years'
r3 = VisaRequirement.create :description=>'Completed tertiary education'
r4 = VisaRequirement.create :description=>'Occupation in the SOL list'

v1.visa_requirements << r1
v1.visa_requirements << r2
v1.visa_requirements << r3
v1.visa_requirements << r4

Helpful.destroy_all

h1 = Helpful.create :helped => true
h2 = Helpful.create :helped => true
h3 = Helpful.create :helped => true
h4 = Helpful.create :helped => false
h5 = Helpful.create :helped => true
h6 = Helpful.create :helped => false


u1.articles << a1
u1.articles << a2
u1.articles << a3

u1.save

c1.articles << a1
c1.articles << a2
c2.articles << a3
c2.articles << a2

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
