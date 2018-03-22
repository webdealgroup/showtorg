	this.removeNode = function(node) {
		Ext.Msg.show({
			animEl: node.getUI().getTextEl(),
			closable: false,
			buttons: Ext.MessageBox.OKCANCEL,
			modal: false,
			title: 'Точно?',
			msg: 'Вы уверены, что хотите удалить страницу?',
			fn: function(btn) {
				if (btn != 'ok') return;
				Ext.Ajax.request({
					scope: this,
					url: './?page=templates',
					method: 'POST',
					params: {
						table: 'templates',
						task: 'deletePage',
						key: 'id',
						rows: node.id,
						recursive: 1
					},
					success: function(response,options) {
						node.remove();
					}
				});
			},
			scope: this
		});
	};
