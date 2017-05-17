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
