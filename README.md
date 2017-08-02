# GRAB BAG - Dark Clout Edition
## How much information are you giving up?

![Image of Yaktocat](https://github.com/squeemishly/dark_clout/blob/readme_update/app/assets/images/dark-clout.png?raw=true)

## Overview

The goal of Dark Clout is to show users exactly what type of information they are giving up when they choose to use an upload service and login with Facebook. Our group wanted to expose how much information Facebook gives developers with the seemingly harmless public information permission. Using easy to understand charts, Dark Clout exposes your virtual profile.

This brownfield project, originally named Grab Bag, was designed to mimic the functionality of Dropbox by giving users the ability to upload images and files using the S3 Bucket.  

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

A visual representation of the schema is here:
![schema pic](app/assets/images/30_july_schema.png?raw=true)

### Features

#### Dark Clout
 * A user can view a breakdown of:
    * the most popular adjectives found in the users uploaded documents.
    * all files uploaded and the filetype breakdown.
    * the camera model breakdown.
    * the percentage of nouns that you use, that comform to British vs American spelling.
    * your top 5 'Likers' on Facebook
    * your top 5 'Commenters' on Facebook
    * your top 5 'Taggers' on Facebook
    * your photos locations broken up by year and displayed on a map
    * your photo and comment activity broke up by year. 
    
 * For a full breakdown of features, visit the [original repo](https://github.com/turingschool-projects/grab_bag):

### Design
* [Materialize](http://materializecss.com/)

### Test Suite

* The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Contributors

* [Natalia Colomé](https://github.com/nmcolome)
* [Adam Gunther](https://github.com/adamgunther1)
* [Mason Holland](https://github.com/MasonHolland)
* [Carl Richmond](https://github.com/ACC25)
* [Kristen (squee) Mueller](https://github.com/squeemishly)
