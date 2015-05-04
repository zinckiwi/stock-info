import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

export default Router.map(function() {
	this.resource("companies", { path: "/" }, function() {
		this.resource("company", { path: "/:symbol" }, function() {
			this.route("prices", { path: "/prices" });
		});
	});
});
