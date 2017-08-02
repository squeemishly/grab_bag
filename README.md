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
* Run `bundle exec rake db:{create,migrate,seed}` to set up the database locally and seed it with files, folders, users, and comments
* run `bundle exec figaro install`
* run `brew update`
* Check java version with `java -version`
* If you don't have java installed go to http://www.oracle.com/technetwork/java/javase/downloads/index.html
* Once java is installed run `rvm install jruby`
* Run `jruby --version` to ensure it is installed
* If you run `rails s` you should get an error that rails is not installed. Follow the prompt to install rails.
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

* To run the application in the dev environment, you'll need several tabs in your terminal:
* `rails s`
* `redis-server`
* `bundle exec sidekiq`
* Visit http://localhost:3000/ and enjoy

### Schema

A visual representation of the schema is here:
![schema pic](app/assets/images/30_july_schema.png?raw=true)

### Features

#### Visitor
 * A visitor is an un-logged in user
 * A visitor can view public folders, and that's about it

#### User
 * A user can sign up for an account via Facebook
 * They must provide a username and phone number
 * A user can view and edit their details
 * A user is created with a home folder, via a private `make_folder` method. `@user.home` will return this folder
 * A user has `owned_folders`, a relationship through `Folder`, through the foreign key `user_id`
 * A user can click on `Dark Clout` and be taken to an analytics dashboard that provides a break down of various information gleaned from your provided info.

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

#### Admin
 * An admin can make other users into admins, deactivate users, and delete files and folders

#### Folder
 * Every user is created with a home folder
 * When a new folder is created, its entire path is stored in the database
 * Folders can be created as public or private
 * Folders have a method `children`. This includes both other folders and binaries stored in that folder
 * Folders have a method `url`, which concatenates a complete route by combining the `owner.username` and the `route`

#### File (in the schema, Binary)
 * Files can be uploaded or downloaded if they belong to that user, or if they are in a folder shared with that user
 * Files can be previewed on the page
 * Binary has a `url` method which builds the url by combining the `folder.url`, `name`, and `extension`

#### Like
 * A user can like a comment or a file to which he has access, and can like it as many times as he wants, so feel free to go a bit crazy
 * Related to Binaries and Comments through a polymorphic association

### Design
* We used [Materialize](http://materializecss.com/) to style our website.

### Test Suite

* The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Contributors

* [Natalia Colomé](https://github.com/nmcolome)
* [Adam Gunther](https://github.com/adamgunther1)
* [Mason Holland](https://github.com/MasonHolland)
* [Carl Richmond](https://github.com/ACC25)
* [Kristen (squee) Mueller](https://github.com/squeemishly)
