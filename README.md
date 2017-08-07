# GRAB BAG - Dark Clout Edition
## How much information are you giving up?

![Dark Clout logo](https://github.com/squeemishly/dark_clout/blob/readme_update/app/assets/images/dark-clout.png?raw=true)

## Overview

The goal of Dark Clout is to show users exactly what type of information they are giving up when they choose to use an upload service and login with Facebook. Building upon the original functionality of Grab Bag, the new dashboard highlights how much information Facebook gives developers with the seemingly harmless public information permission. Using background workers and easy to understand charts, Dark Clout gathers and exposes your virtual profile.

This brownfield project, previously named [Grab Bag](https://github.com/turingschool-projects/grab_bag), was designed to mimic the functionality of Dropbox by giving users the ability to upload images and files using the S3 Bucket.  

### Stack
This site was built with Javascript, JQeury, SASS, Materialize, ChartsJS, AM Charts, Postgresql, Rails 5.1.2, Ruby 2.4.1, Redis, Sidekiq and the Facebook API.

### Setup

To set up a local copy of this project, perform the following:

* Clone the repository: `git clone https://github.com/squeemishly/dark_clout`
* `cd` into the project's directory
* Run `bundle install`
* Run `bundle exec rake db:{create,migrate,seed}`
* run `bundle exec figaro install`
* run `brew update`
* Check java version with `java -version`
* If you don't have java installed go to http://www.oracle.com/technetwork/java/javase/downloads/index.html
* Once java is installed run `rvm install jruby`
* Run `jruby --version` to ensure it is installed
* Run `rails s` and follow the prompts and restart computer
* Run `bundle update`
* Run `bundle install`

### Environment Variables
You will need to procure your own environment variables for the following:
* facebook_key:
* facebook_secret:
* facebook_name:
* facebook_email:
* facebook_token:
* facebook_uid:
* AWS_ACCESS_KEY_ID:
* AWS_SECRET_ACCESS_KEY:
* S3_BUCKET:

You can setup your redis keys as the standard:
* REDIS_HOST: 'localhost'
* REDIS_PORT: '6379'

### Running the Application

* To run the application in a development environment, you'll need several tabs in your terminal:
* `rails s`
* `redis-server`
* `bundle exec sidekiq`
* Visit http://localhost:3000/ and enjoy

### Schema

[You can find our schema here](http://ondras.zarovi.cz/sql/demo/?keyword=dark-clout-1703be)

### Features

#### Dark Clout
 * A user can view a breakdown of:
    * the most popular adjectives found in the users uploaded documents.
    * all files uploaded and the filetype breakdown.
    * the camera model breakdown.
    * the percentage of nouns that you use that conform to British vs American spelling.
    * your top 5 'Likers' on Facebook
    * your top 5 'Commenters' on Facebook
    * your top 5 'Taggers' on Facebook
    * your photos locations broken up by year and displayed on a map
    * your photo and comment activity broke up by year.

 * For a full breakdown of features, visit the [original repo](https://github.com/turingschool-projects/grab_bag):

### Pictures

[[https://github.com/squeemishly/dark_clout/app/assets/images/Cloud_Storage_Stats.jpeg?raw=true]]

![fb photos comments](https://github.com/squeemishly/dark_clout/blob/development/app/assets/images/Facebook_Stats.jpeg?raw=true)

![fb photos map](https://github.com/squeemishly/dark_clout/blob/readme_update/app/assets/images/Photos_By_Year.jpeg)

[[https://github.com/squeemishly/dark_clout/blob/readme_update/app/assets/images/Photos_And_Comments_By_Year.jpeg?raw=true]]

### Design
* [Materialize](http://materializecss.com/)

### Contributors

* [Natalia Colomé](https://github.com/nmcolome)
* [Adam Gunther](https://github.com/adamgunther1)
* [Mason Holland](https://github.com/MasonHolland)
* [Carl Richmond](https://github.com/ACC25)
* [Kristen (squee) Mueller](https://github.com/squeemishly)
