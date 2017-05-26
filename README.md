## Simple Settler##
_"Simple Settler_" is a functional MVP site built in rails by Loui Amon & Ron Tan in November 2016.

### Technologies used:
* Ruby on Rails
* Javascript / jQuery
* AJAX

### Additional Gems:
* ckeditor
* paperclip
* devise

### Functionality:
* Auto-complete search
* City star rating
* Article rating
* Visualised data into charts
* Fully functional CRUD system
* AJAX tab bar for cities category

### What we would like to do in the future:

* Refactor the code.
* Make the AJAX tab bar dynamically change the url
* Add modal popups for various forms and information
* Add more functionality for admin users, such as charts and graphs.
* Use websockets to implement a live chat feature.


### Link to our site:

[Simple Settler](http://easysettler.herokuapp.com/)

### run bundle rake db:migrate
### run bundle

# Set articles to published
Article.all.each do |article|
  article.status = 1
  article.save
end

## setup visa details and visa types
v1 = VisaType.create :name=>'Work Visa', :description=>''
v2 = VisaType.create :name=>'Student Visa', :description=>''
v3 = VisaType.create :name=>'Extend Visa', :description=>''
v4 = VisaType.create :name=>'Temporary Residency', :description=>''
v5 = VisaType.create :name=>'Permanent Residency', :description=>''
v6 = VisaType.create :name=>'Citizenship', :description=>''
v7 = VisaType.create :name=>'Other', :description=>''


r1 = VisaRequirement.create :description=>'Be atleast 18+ years old'
r2 = VisaRequirement.create :description=>'Lived in sydney for 2 years'
r3 = VisaRequirement.create :description=>'Completed tertiary education'
r4 = VisaRequirement.create :description=>'Occupation in the SOL list'

v1.visa_requirements << r1
v1.visa_requirements << r2
v1.visa_requirements << r3
v1.visa_requirements << r4
