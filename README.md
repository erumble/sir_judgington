Sir Judgington
=========

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Diagnostics
-----------

This application was built with recipes that are NOT known to work together.

This application was built with preferences that are NOT known to work
together.

If the application doesn’t work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include these diagnostics:

We’d also like to know if you’ve found combinations of recipes or
preferences that do work together.

Recipes:

* controllers
* core
* deployment
* email
* extras
* frontend
* gems
* git
* init
* learn_rails
* models
* prelaunch
* rails_bootstrap
* rails_devise
* rails_devise_pundit
* rails_foundation
* rails_omniauth
* rails_signup_download
* railsapps
* readme
* routes
* saas
* setup
* testing
* tests4
* views

Preferences:

* git: true
* apps4: none
* dev_webserver: passenger
* prod_webserver: passenger
* database: mysql
* templates: erb
* tests: rspec
* continuous_testing: guard
* frontend: bootstrap3
* email: gmail
* authentication: devise
* devise_modules: default
* authorization: pundit
* form_builder: simple_form
* starter_app: admin_app
* rvmrc: false
* quiet_assets: true
* local_env_file: figaro
* better_errors: true
* pry: true
* ban_spiders: true
* deployment: capistrano3

Ruby on Rails
-------------

This application requires:

-   Ruby
-   Rails

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Database
--------

This application uses PostgreSQL with ActiveRecord.

To setup PostgreSQL on CentOS, perform the following steps:  
1. run `sudo yum install -y postgresql-server postgresql-devel postgresql`  
2. run `sudo service postgresql initdb`
3. run `sudo vim /var/lib/pgsql/data/pg_hba.conf` and replace the last 2 occurences of the word `ident` with the word `md5`  
3. run `sudo service postgresql start`  
4. run `sudo chkconfig postgresql on`  
5. run `sudo -u postgres psql` to access the postgres command line  
6. from the postgres command line run `create role sir_judgington with createdb login password '<password>';`  
7. add the previously created credentials to the .env file (not the .env.example file)

Development
-----------

-   Template Engine: ERB
-   Testing Framework: Test::Unit
-   Front-end Framework: Bootstrap 3.0 (Sass)
-   Form Builder: SimpleForm
-   Authentication: Devise
-   Authorization: None
-   Admin: None

Email
-----

The application is configured to send email using a Gmail account.

Email delivery is disabled in development.

Getting Started
---------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Documentation and Support
-------------------------

This is the only documentation.

#### Issues

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Similar Projects
----------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Contributing
------------

If you make improvements to this application, please share with others.

-   Fork the project on GitHub.
-   Make your feature addition or bug fix.
-   Commit with Git.
-   Send the author a pull request.

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please contact
me and I’ll add a note to the README so that others can find your work.

Credits
-------

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

License
-------

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
