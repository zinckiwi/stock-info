import DS from "ember-data";

export default DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
	attrs: {
		prices: {embedded: 'always'}
	}
});
