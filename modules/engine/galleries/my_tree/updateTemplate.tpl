		this.updateTemplate = function(node,tpl,item) {
			Ext.Ajax.request({
				scope: this,
				url: './?page=galleries',
				method: 'POST',
				params: {
					table: 'galleries',
					task: 'update',
					key: 'id',
					keyID: node.id,
					field: 'tpl',
					value: tpl
				},
				success:
					function(response,options) {
						node.attributes.tpl = item.initialConfig.text;
						item.setChecked(true);
					}
			});
		};
