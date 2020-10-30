# _Local Restaurants and Shops API_

_30 October 2020_

#### _API for finding local restaurant and shop data_

#### By _**Vanessa Stewart**_

## Description

_This is a Friday project for Epicodus. The original instructions for the project include:_

For your final Ruby/Rails code review, you may build one of the three APIs below. (You may also build an API of your choosing if you prefer.)

Animal Shelter: Create an API for a local animal shelter. The API will list the available cats and dogs at the shelter.
Local Business Lookup: Create an API for a local business lookup. The API will list restaurants and shops in town.
Parks Lookup: Create an API for state and national parks. The API will list state and national parks.
You have the freedom to build out your APIs as you wish. Try adding the following to your API:

Endpoints for GET (all and by id), POST, PUT and DELETE.
A RANDOM endpoint that randomly returns a park/business/animal.
A second custom endpoint that accepts parameters (example: a SEARCH route that allows users to search by specific park names).
Model scopes to process parameters from API calls.
At least one of the objectives from Monday's Further Exploration lesson (such as versioning, token authentication, or serialization).
Thorough exception handling.
Complete testing with request specs.
Randomized data with Faker or your own custom seed code.
A README that thoroughly documents all endpoints, including parameters that can be passed in.

## API Call Documentation
### Restaurants

| Request | Path | Description | Request URL | Response Header | Response Body Example | Error Header | Error Response Body |
| ------- | ---- | ----------- | ----------- |---------------- | --------------------- | ------------ | ------------------- |
| GET | /restaurants | Get a list of all restaurants |  http://localhost:3000/restaurants | 200: OK | [ { "id": 1, "name": "Fast Bar & Grill", "kind": "Bar", "description": "To deliver an exceptional shopping experience by offering the best service, value, quality, and freshest products while being good stewards of our environment and giving back to the communities we serve.", "review": "The counter is on the left side, and so is the menu. It can get pretty busy with 30 min wait times. I recommend checking the website and see how busy their store is.", "created_at": "2020-10-30T16:16:55.703Z", "updated_at": "2020-10-30T16:16:55.703Z" } ] | - | - |
| GET | /restaurants{page} | Get a list of 25 restaurants per page | http://localhost:3000/restaurants?page=1 | 200: OK | [ { "id": 1, "name": "Fast Bar & Grill", "kind": "Bar", "description": "To deliver an exceptional shopping experience by offering the best service, value, quality, and freshest products while being good stewards of our environment and giving back to the communities we serve.", "review": "The counter is on the left side, and so is the menu. It can get pretty busy with 30 min wait times. I recommend checking the website and see how busy their store is.", "created_at": "2020-10-30T16:16:55.703Z", "updated_at": "2020-10-30T16:16:55.703Z" } ] | - | - |
| GET | /restaurants/{restaurant_id} | Get restaurant with id matching given parameter | http://localhost:3000/restaurants/20 | 200: OK | { "id": 20, "name": "Spice Burger", "kind": "Burgers", "description": "To provide an exceptional dining experience that satisfies our guests’ grown-up tastes by being a Cut-Above in everything we do.", "review": "The chicken nachos were delicious and the atmosphere was great. The frozen margaritas were a little on the weak side. Would probably return for a work happy hour but was pretty disappointed about the lack of free tequila and beer we read about!", "created_at": "2020-10-30T16:16:55.737Z", "updated_at": "2020-10-30T16:16:55.737Z" } | 404: Not Found| { "message": "Couldn't find Restaurant with 'id'=20" } |
| POST | /restaurants{name, kind, description, review} | Add a new restaurant |  http://localhost:3000/restaurants?name=test&kind=test&description=test&review=test | 201: Created | { "id": 102, "name": "test", "kind": "test", "description": "test", "review": "test", "created_at": "2020-10-30T21:56:42.448Z", "updated_at": "2020-10-30T21:56:42.448Z" } | 422: Unprocessable Entity | { "message": "Validation failed: Name can't be blank, Kind can't be blank, Description can't be blank, Review can't be blank" } |
| PUT | /restaurants/{restaurant_id}{name, kind, description, review}  | Edit a specific restaurant | http://localhost:3000/restaurants/52?name=Pho%20City&kind=Vietnamese | 200: OK | { "message": "Restaurant successfully updated." } | - | - |
| DELETE | /restaurants/{restaurant_id} | Delete a specific restaurant | http://localhost:3000/restaurants/1000 | 200: OK | { "message": "Restaurant successfully deleted." } | 404: Not found | { "message": "Couldn't find Restaurant with 'id'=1000" } |
| GET | /restaurants/random | Get a random restaurant | http://localhost:3000/restaurant/random | 200: OK | { "id": 7, "name": "Green Shakes", "kind": "Sushi", "description": "To deliver an exceptional shopping experience by offering the best service, value, quality, and freshest products while being good stewards of our environment and giving back to the communities we serve.", "review": "In terms of omakase, they had a few options but the one we chose was the 87 dollar version which include sashimi and sushi.", "created_at": "2020-10-30T16:16:55.717Z", "updated_at": "2020-10-30T16:16:55.717Z" } | - | - |
| GET | /restaurants/search{name, kind, page} | Search for a restaurant by name or kind or both. Can enter a page paremeter to get results of 25 restaurants per page. | http://localhost:3000/restaurant/search?name=grill&kind=bar&page=1 | 200: OK | [ { "id": 1, "name": "Fast Bar & Grill", "kind": "Bar", "description": "To deliver an exceptional shopping experience by offering the best service, value, quality, and freshest products while being good stewards of our environment and giving back to the communities we serve.", "review": "The counter is on the left side, and so is the menu. It can get pretty busy with 30 min wait times. I recommend checking the website and see how busy their store is.", "created_at": "2020-10-30T16:16:55.703Z", "updated_at": "2020-10-30T16:16:55.703Z" }, { "id": 8, "name": "4607 Grill", "kind": "Bar", "description": "Our mission is to be a leader in the distribution and merchandising of food, pharmacy, health and personal care items, seasonal merchandise, and related products and services. We place considerable importance on forging strong supplier partnerships. Our suppliers, large or small, local or global, are essential components in accomplishing our mission.", "review": "Brand new. Great design. Odd to hear pop music in a Mexican establishment. Music is a bit loud. It should be background.", "created_at": "2020-10-30T16:16:55.719Z", "updated_at": "2020-10-30T16:16:55.719Z" } ] | - | - |


### Shops
| Request | Path | Description | Request URL | Response Headers | Response Body Example | Error Header | Error Response Body |
| ------- | ---- | ----------- | ----------- |----------------- | --------------------- | ------------ | ------------------- |
| GET | /shops | Get a list of all shops |  http://localhost:3000/shops | 200: OK | [{ "id": 2,"name": "Denesik, Green and Zulauf", "industry": "Health, Wellness and Fitness", "logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/6.png", "slogan": "Down-sized cohesive local area network" "created_at": "2020-10-30T16:17:46.061Z", "updated_at": "2020-10-30T16:17:46.061Z" }] | - | - |
| GET | /shops{page} | Get a list of 25 shops per page | http://localhost:3000/shops?page=1 | 200: OK | [{ "id": 2,"name": "Denesik, Green and Zulauf", "industry": "Health, Wellness and Fitness", "logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/6.png", "slogan": "Down-sized cohesive local area network" "created_at": "2020-10-30T16:17:46.061Z", "updated_at": "2020-10-30T16:17:46.061Z" }] | - | - |
| GET | /shops/{shop_id} | Get shop with id matching given parameter | http://localhost:3000/shops/20 | 200: OK | { "id": 20, "name": "Doyle and Sons", "industry": "Aviation & Aerospace", "logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/6.png", "slogan": "User-centric solution-oriented standardization", "created_at": "2020-10-30T16:17:46.091Z", "updated_at": "2020-10-30T16:17:46.091Z" }| 404: Not Found| { "message": "Couldn't find Shop with 'id'=20" } |
| POST | /shops{name, industry, logo_url, slogan} | Add a new shop |  http://localhost:3000/shops/52?name=test&industry=test&logo_url=test&slogan=test | 201: Created | { "id": 52, "name": "test", "industry": "test", "logo_url": "test", "slogan": "test", "created_at": "2020-10-30T22:00:55.535Z", "updated_at": "2020-10-30T22:00:55.535Z" } | 422: Unprocessable Entity | { "message": "Validation failed: Name can't be blank, Industry can't be blank, Logo url can't be blank, Slogan can't be blank"} |
| PUT | /shop/{shop_id}{name, industry, logo_url, slogan} | Edit a specific shop | http://localhost:3000/shops/52?name=updated_name | 200: OK | { "message": "Shop successfully updated." } | - | - |
| DELETE | /shops/{shop_id} | Delete a specific shop | http://localhost:3000/shops/1000 | 200: OK | { "message": "Shop successfully deleted." } | 404: Not found | { "message": "Couldn't find Shop with 'id'=1000" } |
| GET | /shops/random | Get a random shop | http://localhost:3000/shop/random | 200: OK | { "id": 25, "name": "Hudson, Metz and Bartell", "industry": "Market Research", "logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/13.png", "slogan": "Team-oriented object-oriented function", "created_at": "2020-10-30T16:17:46.099Z", "updated_at": "2020-10-30T16:17:46.099Z" } | - | - |
| GET | /shops/search{name, kind, page} | Search for a shop by name or kind or both. Can enter a page paremeter to get results of 25 shops per page. |  http://localhost:3000/shop/search?name=L&kind=railroad&page=1 | 200: OK | [ { "id": 5, "name": "Lubowitz-O'Reilly", "industry": "Railroad Manufacture", "logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/13.png", "slogan": "Configurable uniform circuit", "created_at": "2020-10-30T16:17:46.067Z", "updated_at": "2020-10-30T16:17:46.067Z" }, { "id": 21, "name": "Lockman Group", "industry": "Railroad Manufacture", "logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/12.png", "slogan": "Multi-layered background product", "created_at": "2020-10-30T16:17:46.092Z", "updated_at": "2020-10-30T16:17:46.092Z" } ] | - | - |

## Setup/Installation Requirements

To Access and Extend This Project:

1. Install Rails
- For this project, you will need Ruby. Follow the directions [here](https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/ruby-installation-and-setup) for setting up Ruby.
- Install Rails on your machine with the following terminal command `gem install rails -v 5.2.0`

2. Clone Repo and Install Bundler
- Navigate to the directory on your local computer where you would like to clone this repo.
- Clone this repo using the `git clone` command in terminal/command line.
- Navigate to the cloned folder and run `gem install bundler` to install Bundler, which will mange all gem installations for our project.
- Run `bundle` or `bundle install` in your command line to download all dependencies. (If you add additional gems later, you will need to run `bundle update <gem name>`.)

3. Set Up Database
- Run `rake db:setup` in the terminal. This is akin to running the following rake tasks all at once: db:create(creates the dev and test databases for the current env), db:schema:load (recreates the database from the schema.rb file), and db:seed(runs the db/seed.rb file).

4. Open in Text Editor
- Open the cloned repo in a text editor of your choice.
- To Run Tests: While in the root directory of this project, run `rspec` in your command line.
- To Run the App in Browser: While in the root directory of the project, run `rails s` in the terminal. This will start a server, which you can access by entering `localhost:3000` in your browser.

## Known Bugs

_There are no known bugs at this time._

## Support and Contact Details

_Connect with me at vamariestewart@gmail.com with ideas to improve this project and/or with general compliments, jokes, riddles, fun facts, and other sundry sparks of joy._

## Technologies Used

* Ruby
* Rails with Postgres
* Ruby Gems: Factory Bot Rails, Faker, Kaminari, Launchy, Pry, PG, RSpec, Ruby-Limiter, Shoulda-Matchers

### License

Copyright (c) 2020 **_Vanessa Stewart_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
