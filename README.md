# Rusic

Generate and deploy Rusic themes with ease.

This allows you to:

* Create a set of theme templates and assets
* Deploy those templates and assets to Rusic seamlessly

This mean you can develop themes on your local machine (using your editor of
choice) and see the changes live on Rusic immediately.

## Dependencies

* Ruby 1.9+
* Rubygems

## Install

    $ gem install rusic

## Usage

```
$ rusic
Tasks:
  rusic help [TASK]   # Describe available tasks or one specific task
  rusic new NAME      # Create a new Rusic theme
  rusic deploy [ENV]  # Upload theme to Rusic
  rusic settings      # Display settings from a .rusic file
  rusic version       # Display version of Rusic gem
```

### Generate new theme

```shell
$ rusic help new
Usage:
  rusic new NAME

Create a new Rusic theme
```

For example, to create a new theme called "competition-theme"

```shell
$ rusic new competition-theme
create  competition-theme
create  competition-theme/README.md
create  competition-theme/layouts
create  competition-theme/layouts/subdomain.html.liquid
create  competition-theme/ideas
create  competition-theme/ideas/index.html.liquid
create  competition-theme/ideas/new.html.liquid
create  competition-theme/ideas/show.html.liquid
create  competition-theme/ideas/edit.html.liquid
create  competition-theme/pages
create  competition-theme/pages/about.html.liquid
create  competition-theme/assets
create  competition-theme/assets/bootstrap.css
create  competition-theme/assets/bootstrap.js
create  competition-theme/assets/cover.css
create  competition-theme/assets/glyphicons-halflings-regular.eot
create  competition-theme/assets/glyphicons-halflings-regular.svg
create  competition-theme/assets/glyphicons-halflings-regular.ttf
create  competition-theme/assets/glyphicons-halflings-regular.woff
```

This will create a simple, bootstrapped theme

### Deploy theme

```shell
$ rusic help deploy
Usage:
  rusic deploy [ENV]

Options:
      [--api-key=API_KEY]
      [--api-host=API_HOST] # Default: api.rusic.com
      [--theme=THEME]
      [--watch]

Upload theme to Rusic
```

To deploy the "competition-theme" above, we would do

```shell
$ cd competition-theme/
$ rusic deploy --api-key YOUR_API_KEY --theme YOUR_THEME_ID
Saved layouts/subdomain.html.liquid
Saved ideas/edit.html.liquid
Saved ideas/index.html.liquid
Saved ideas/new.html.liquid
Saved ideas/show.html.liquid
Saved pages/about.html.liquid
Saved assets/bootstrap.css
Saved assets/bootstrap.js
Saved assets/cover.css
Saved assets/glyphicons-halflings-regular.eot
Saved assets/glyphicons-halflings-regular.svg
Saved assets/glyphicons-halflings-regular.ttf
Saved assets/glyphicons-halflings-regular.woff
```

### Deploy on file changes

Use the `--watch` flag to watch for changes on files and deploy them automatically

```
$ rusic deploy --api-key YOUR_API_KEY --theme YOUR_THEME_ID --watch
$ touch layouts/subdomain.html.liquid # in another process
Saved layouts/subdomain.html.liquid
```

### Deploy using a `.rusic` file

You can add a `rusic.yml` file to your project directory and set your environments
settings within this file. This file should be valid
[YAML](http://www.yaml.org/start.html) and looks like this -

```yaml
#
api_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
stage:
  theme: 2
production:
  api_key: yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
  theme: 1
```

To deploy to production you need to run

```shell
$ rusic deploy production
```

This also works with `--watch`


```shell
$ rusic deploy production --watch
```

MIT Licenced

Copyright &copy; 2011&ndash;2014, Simpleweb Ltd.
