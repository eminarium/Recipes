# RECIPES

##  :spaghetti: Welcome to the Recipes Web App. :spaghetti:
<br/>


![Main page](/app/assets/images/recipes_main.png)

<br/>

# :information_source: About the project

Current project mainly makes use of Hotwire feature of Rails 7 and it is used in certain pages for effective/performant rerendering.

<br/>

# Technologies used

- Ruby on Rails (v 7)
- Postgresql (v 15.1)


# Gems used
- [devise](https://github.com/heartcombo/devise): to enable flexible authentication solution for our app,
- [figaro](https://github.com/laserlemon/figaro): to make it easy to securely configure Rails applications, and hide env variables.
- [letter_opener](https://github.com/ryanb/letter_opener): for previewing emails locally.
- [bootstrap-email](https://github.com/bootstrap-email/bootstrap-email): to be able to to write emails like you would a website.
- [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on): to allow for custom tagging models within a Rails application.
- [acts_as_list](https://github.com/brendon/acts_as_list): for managing lists. Within our application, to be able to manage recipe instructions like regular lists. 
- [will_paginate](https://github.com/mislav/will_paginate): for pagination purposes, paginating Recipes.
- [friendly_id](https://github.com/norman/friendly_id): for using slugs, to find recipes, instead of using ids.
- [omniauth](https://github.com/omniauth/omniauth): to enable multi-provider authentication for our web application.
- [omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2): to allow Oauth2 strategy for authentication with Google.
- [omniauth-facebook](https://github.com/simi/omniauth-facebook): to allow Oauth2 strategy for authentication with Facebook.
- [omniauth-twitter](https://github.com/arunagw/omniauth-twitter): to allow Oauth2 strategy for authentication with Twitter.
- [omniauth-rails_csrf_protection](https://github.com/cookpad/omniauth-rails_csrf_protection): to provide CSRF protection on OmniAuth request endpoint on our Rails application.
- [faker](https://github.com/faker-ruby/faker): for generating fake data such as recipe names, list titles, and similar content.
- [rspec-rails](https://github.com/rspec/rspec-rails): to be able to test our app with RSpec framework.
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers): to use one-liner tests for common Rails functionality.



# Features


## Guest can:
- SIGN UP via (email / Gmail / Facebook / Twitter),
- READ shared/all Recipes.

## User can:
- SIGN IN via (email / Gmail / Facebook / Twitter),
- CREATE / READ / UPDATE / DELETE its own Recipes,
- READ own, liked, shared Recipes,
- LIKE / UNLIKE others Recipes,
- COOKMARK / UNCOOKMARK others Recipes (mark as cooke / unmark as cooked),
- FOLLOW / UNFOLLOW other Users,
- CREATE / READ / UPDATE / DELETE its own Lists,
- ADD / REMOVE other Users' Recipes to its own lists,

<br/>

# Setup
To run this project: 
* install required gems with -   `bundle install`:
* run the project locally with - `rails s`

```bash
# install required gems
$ bundle install

# run the project locally
$ rails s
```