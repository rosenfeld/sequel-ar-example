# About this example application

This application was created as part of [this article](http://rosenfeld.herokuapp.com/en/articles/ruby-rails/2013-12-18-sequel-is-awesome-and-much-better-than-activerecord)
comparing Sequel to ActiveRecord.

# Setup instructions

These instructions assume you have PostgreSQL installed and set-up in such a way you don't have
to specify any user/password to create databases and access them.

    bundle
    createdb exampledb
    sequel -m migrations postgres://localhost/exampledb

You can try using the bundled models in an IRB session through:

    ./console

Sequel models are under models/sq (under the Sq module) and ActiveRecord models are under
models/ar (under the AR module). For instance, after running `./console`, try this:

    2.times{Thread.start{Sq::Field.count}.join}
    2.times{Thread.start{Ar::Field.count}.join}

