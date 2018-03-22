		this.getCurrency = function() {
			Ext.Ajax.request({
				scope: this,
				url: './?page=currency',
				method: 'POST',
				params: {
					table: 'currency',
					task: 'getCurrency'
				},
				success:
					function(response,options) {
                        var responseData = Ext.util.JSON.decode(response.responseText);
                        my_tree.getTopToolbar().items.items[4].setText("Курс = " + responseData.name);
					}
			});
		};
