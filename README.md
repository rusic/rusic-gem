rusic
=====

This gem makes it easy to develop themes for rusic.com. It can generate
themes, as well as serve them from a local server.

## Install

You'll need ruby, if you're on OS X you'll already have it. Then you'll
need to install the gem.

    gem install rusic

If this gives you a permission error you might need to use `sudo`.

## Usage

With the gem installed you can now generate a theme using the rusic
command line tool.

    cd ~/Desktop # Or somewhere else maybe
    rusic new example-theme

    cd example-theme
    rusic start

This will start up a server at http://localhost:4567/.

### Management

To simulate the different states the bucket can be in you can, for the
most part, use the web interface. However some things require custom
settings, for this you can use the `rusic set` command.

#### Bucket expires

To set an expiry date on the bucket, use the following command:

    rusic set expires "in 3 hours"

#### Bucket name

    rusic set name "My bucket"

## Features

* Super long urls
* Wide range of markdown examples
* Ideas, comments and likes in different states
* Toggle the timer for the bucket
* Simulate log in and out
* Flash messages
* Custom fields

## Publishing themes

Once you're happy with your theme, you'll want to publish it to your
rusic bucket. This can also be done with the `rusic(1)` cli tool.

The static assets will be shipped off to s3 for you, and the templates
will be uploaded using the API.

MIT Licenced

Copyright (c) 2011, Chris Mytton / Simpleweb
