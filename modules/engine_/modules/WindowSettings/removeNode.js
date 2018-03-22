	this.removeNode = function(node) {
		Ext.Msg.show({
			animEl: node.getUI().getTextEl(),
			closable: false,
			buttons: Ext.MessageBox.OKCANCEL,
			modal: false,
			title: 'Точно?',
			msg: 'Вы уверены, что хотите удалить страницу и ВСЕ её подстраницы?',
			fn: function(btn) {
				if (btn != 'ok') return;
				Ext.Ajax.request({
					scope: this,
					url: './?page=modules',
					method: 'POST',
					params: {
						table: 'modules',
						task: 'delete',
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
