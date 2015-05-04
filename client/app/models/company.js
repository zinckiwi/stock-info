import DS from "ember-data";

export default DS.Model.extend({
	symbol: DS.attr('string'),
	name: DS.attr('string'),
	lastSale: DS.attr('number'),
	marketCap: DS.attr('string'),
	ipoYear: DS.attr('string'),
	sector: DS.attr('string'),
	industry: DS.attr('string'),
	summaryQuote: DS.attr('string'),

	prices: DS.hasMany('price').property(),

	longName: Ember.computed(function() {
		return this.get('name') + ' (' + this.get('symbol') + ')';
	}).property('symbol', 'name'),

	priceData: Ember.computed(function() {
		var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		var prices = this.get('prices');
		var labels = prices.map(function(price) {
			return months[price.get('tradeDate').getMonth()] + ' ' + price.get('tradeDate').getDate();
		});
		var data = prices.mapBy('average');
		var chartArgs = {
			labels: labels,
			datasets: [{
				fillColor: "rgba(0,0,0,0)",
				strokeColor: "rgba(0,0,0,1)",
				pointColor: "#fff",
				pointStrokeColor: "rgba(0,0,0,1)",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(0,0,0,1)",
				data: data
			}],
			options: {
				datasetStrokeWidth: 4,
				pointDotStrokeWidth: 4,
				scaleLabel: '$<%=Number(value).toFixed(2)%>',
				showTooltips: false,
				scaleBeginAtZero: true
			}
		};
		return chartArgs;
	}).property('prices')
});
