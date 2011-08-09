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
    rusic server

This will start up a server at http://localhost:8080/.

MIT Licenced

Copyright (c) 2011, Chris Mytton / Simpleweb
