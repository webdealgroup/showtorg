	this.updateStatus = function(node, item) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=modules',
			method: 'POST',
			params: {
				table: 'modules',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'status',
				value: item.initialConfig.set_status
			},
			success:function(response,options) {
				node.attributes.status = key;
				item.setChecked(true);
			}
		});
	};
