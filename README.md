# GRAB BAG
## The hottest new way to store and share your files

View it live at: https://grab-bag-1701.herokuapp.com/

## Overview

The goal of this project was to 'clone' the base functionality of Dropbox.

### Setup

To set up a local copy of this project, perform the following:

* Clone the repository: `git clone https://github.com/squeemishly/dark_clout`
* `cd` into the project's directory
* Run `bundle install`
* Run `bundle exec rake db:{create,migrate,seed}` to set up the database locally and seed it with files, folders, users, and comments
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

To login as an admin (in development), use these credentials:
* username: admin1
* password: password


### Schema

A visual representation of the schema is here:
![schema pic](app/assets/images/30_july_schema.png?raw=true)


### Features

#### Visitor
 * A visitor is an un-logged in user
 * A visitor can view public folders, and that's about it

#### User
 * A user can sign up for an account via Facebook or create one manually
 * Regardless of signup method, they must provide a username and phone number for Two Factor Authentication purposes
 * A user can view and edit their details
 * A user can reset their password with a text confirmation (via Twilio)
 * A user is created with a home folder, via a private `make_folder` method. `@user.home` will return this folder
 * A user has `owned_folders`, a relationship through `Folder`, through the foreign key `user_id`

#### Admin
 * An admin can make other users into admins, deactivate users, and delete files and folders

#### Folder
 * Every user is created with a home folder
 * When a new folder is created, its entire path is stored in the database
 * Folders can be created as public or private
 * Folders can be shared by entering another user's email, which sends that user an email invite link
 * Folders have a method `children`. This includes both other folders and binaries stored in that folder
 * Folders have a method `url`, which concatenates a complete route by combining the `owner.username` and the `route`

#### File (in the schema, Binary)
 * Files can be uploaded or downloaded if they belong to that user, or if they are in a folder shared with that user
 * Files can be previewed on the page
 * Binary has a `url` method which builds the url by combining the `folder.url`, `name`, and `extension`

#### Comment
 * A user can leave comments on any file that is owned or shared with him

#### Like
 * A user can like a comment or a file to which he has access, and can like it as many times as he wants, so feel free to go a bit crazy
 * Related to Binaries and Comments through a polymorphic association

### Design
* We used [Materialize](http://materializecss.com/) to style our website.

### Test Suite

* The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Dependencies

* This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.

### Contributors

* [Natalia Colomé](https://github.com/nmcolome)
* [Adam Gunther](https://github.com/adamgunther1)
* [Mason Holland](https://github.com/MasonHolland)
* [Carl Richmond](https://github.com/ACC25)
* [Kristen (squee) Mueller](https://github.com/squeemishly)
