
# LGBTQ.fm [![Build Status](https://travis-ci.org/lgbtq/lgbtq-tech-podcast.svg?branch=master)](https://travis-ci.org/lgbtq/lgbtq-tech-podcast)

Source code for [lgbtq.fm](http://lgbtq.fm)

## Developing Locally

The site uses [Middleman](http://middlemanapp.com) for generating static HTML and assets from source files. To setup Middleman and other dependencies, and build the site, use Make:

    $ make
    rm -rf build/
    which bundle || gem install bundler
    ~/.gem/ruby/2.1.3/bin/bundle
    bundle check || bundle install
    The Gemfile's dependencies are satisfied
    time bundle exec middleman build
          create  build/stylesheets/normalize.css
          create  build/stylesheets/index.css
          create  build/stylesheets/all.css
    ...

If you want to setup a server that will automatically update changes you make locally, use the `middleman` command to start a web server on port 4567:

    $ middleman
    == The Middleman is loading
    == The Middleman is standing watch at http://0.0.0.0:4567
    == Inspect your site configuration at http://0.0.0.0:4567/__middleman/

The site should now be viewable at [http://localhost:4567](http://localhost:4567). Any changes made to the source should be viewable after a page refresh in your browser.

## Deploying

[Travis CI](https://travis-ci.org) tests every branch to ensure that the site can be built.

If the branch is on this repo ([[lgbtq/lgbtq-tech-podcast](https://github.com/lgbtq/lgbtq-tech-podcast)), each successful branch build will be deployed to [beta.lgbtq.fm](http://beta.lgbtq.fm).

Merging any branch to master will deploy to [lgbtq.fm](http://lgbtq.fm).
