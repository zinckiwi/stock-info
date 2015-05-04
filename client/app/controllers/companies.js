import Ember from "ember";

export default Ember.Controller.extend({
	filter: '',
	actions: {
		changedFilter: function() {
			this.set('model',
				this.get('filter').length ?
					this.store.find('company', {name: this.get('filter')}) :
					[] // no filter, no results!
			);
		}
	}
});
