		this.removeSubNode = function(node) {
			Ext.Msg.show({
				animEl: node.getUI().getTextEl(),
				closable: false,
				buttons: Ext.MessageBox.OKCANCEL,
				modal: false,
				title: 'Точно?',
				msg: 'Вы уверены, что хотите удалить ВСЕ её подстраницы?',
				fn: function(btn) {
					if (btn != 'ok') return;
					Ext.Ajax.request({
						scope: this,
						url: './?page=tree',
						method: 'POST',
						params: {
							table: 'tree',
							task: 'subdelete',
							key: 'id',
							rows: node.id,
							recursive: 1
						},
						success: 
							function(response,options) {
                                my_tree.root.reload();
								//node.remove();
							}
					});
				},
				scope: this
			});
		};
