export default Ember.Route.extend({
	model: function(params) {
		return this.store.fetchById('company', params.symbol);
	}
});