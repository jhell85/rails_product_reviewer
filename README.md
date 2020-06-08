# _Mario's Specialty Products_

#### June 5th. 2020

#### By _**Joshua Hellman**_

## Description

_This application will direct a user who isn't logged in to a login/signup form. once a user is logged in a user will be able to view available products, clicking on a product's name will take the user to the show page. Show page will allow a user to veiw the cost of a product, country of origin and all reviews for the product. a link on the show page will direct a user to a page to add a review for the product_ 

## Setup/Installation Requirements
## Setup/Installation Requirements
_Make sure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation) installed on your computer._

_Make sure you have [git version control](https://git-scm.com/downloads) installed on your computer._

1. use the green 'Clone or Download' button to copy the link url
2. open terminal and type...

**Windows**
```sh 
cd desktop
```

 Mac & linux 
 ```sh
 cd ~/Desktop
 ```

 3. in terminal type '_git clone https://github.com/jhell85/rails_product_reviewer.git_ '

```sh
git clone https://github.com/jhell85/rails_product_reviewer.git
```

4. navigate to the new folder that was created on your desk
```sh
cd rails_product_reviewer
```


5. run bundle install
```sh
bundle install
```
6. run development server
```sh
npm run start
```
7. you will need to start a data base in psql 
```
rake db:create
rake db:migrate
```
8. if you want to see something in the data base you will need to seed it
```
rake db:seed
```

9. after you this you can start the server.
```sh
rails s
```
10. then type localhost:3000 in the browser of choice and navigate around the app.



## Behavior Driven Development 


  Application Description|
  ----------------------|
 1. App directs users who arn't logged in to a sign in / sign up page|
 2. When a user is logged in it will bring them to the home page with a list of products|
 3. logged in users can click on products to see a discription of the product (show page)|
 4. show page lets a user see a country of orgin for a product, price & all reviews associated with the product|
 5. show page will have a link for a user to add a review for a product|
 6. A user with admin privilages will give the user full CRUD functionality for products and reviews|
 7. When user is logged in a logout link willremain at the top of the page for the user click to logout.|
 8. When user is logged in a home link will remain at the top of the page for the user click to be directed back to the home page.| 

## Known Bugs

_No known bugs at this time_

## Technologies Used

_Ruby, Rails, Gem, Pry, Capybara, ShouldaMatchers_ 

