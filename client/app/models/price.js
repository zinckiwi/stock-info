import DS from "ember-data";

export default DS.Model.extend({
	tradeDate: DS.attr('date'),
	open: DS.attr('number'),
	close: DS.attr('number'),
	high: DS.attr('number'),
	low: DS.attr('number'),
	volume: DS.attr('string'),
	adjustedClose: DS.attr('string'),

	average: Ember.computed(function() {
		return Math.round((
			this.get('open') +
			this.get('close') +
			this.get('low') +
			this.get('high'
		)) * 25) / 100;
	}).property('open', 'close', 'high', 'low')
});
