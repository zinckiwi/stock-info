export default DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
	attrs: {
		prices: {embedded: 'always'}
	}
});
