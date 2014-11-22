Package.describe({
	name: 'dboyliao:errors',
	summary: 'A pattern to display application errors to the user',
	version: '1.0.0',
	git: 'https://github.com/dboyliao/errors.git'
});

Package.onUse(function(api) {
	api.versionsFrom('1.0');
	api.use(['minimongo', 'mongo-livedata', 'templating'], 'client');
	api.use('coffeescript', ['client', 'server']);
	api.use('mquandalle:jade', ['client', 'server']);
	api.addFiles(['errors.coffee', 
				  'errors_list.jade', 
				  'errors_list.coffee'], "client");
	if (api.export) {
		api.export('Errors');
	}
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('coffeescript', ['client', 'server']);
  api.addFiles('dboyliao:errors-tests.coffee');
});
