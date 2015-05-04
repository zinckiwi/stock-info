Installation
------------

Install ruby 2.2 and Node 0.12. Hopefully not forgetting anything:

In server/

	$ bundle
	$ rake db:migrate
	$ rake app:import_companies
	$ rails s

In client/

	$ npm install
	$ npm install -g bower
	$ bower install
	$ ember server --proxy http://localhost:3000/

Notes
-----

Definitely quick and dirty -- sorry, ran out of time for niceties like tests, refactoring, cross-browser testing etc.!

Ran into json rendering performance issues when using the active_model_serializers gem (~10x vs raw jbuilder). Opted to hand-build the Ember-expected structure in jbuilder.
