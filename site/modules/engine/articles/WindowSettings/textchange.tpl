	this.tabs[this.z].on('textchange', function(node,newText,oldText) {

		if (newText == oldText) return;

		if (newText == '') {
			node.remove();
			return Ext.MessageBox.alert('Ошибка','Вы должны указать название для раздела.');
		}

		Ext.Ajax.request({
			scope: this,
			waitMsg: 'Сохранение...',
			url: './?page=articles',
			method: 'POST',
			params: {
				table: 'articles',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'title',
				value: newText,
                field_node: 'tpl',
                value_node: node.attributes.tpl
			},
			failure: function(response,options){
				Ext.MessageBox.alert('Ошибка','Ошибка сохранения!');
			},
			success:function(response,options) {
				var responseData = Ext.util.JSON.decode(response.responseText);
				if (responseData.newID != '0') {		// если была создана новая запись
					node.id = responseData.newID;
					node.attributes.id = node.id;
					node.attributes.name = node.id;
					node.name = node.id;
					Ext.Ajax.request({
						scope: this,
						url: './?page=articles',
						method: 'POST',
						params: {
							table: 'articles',
							task: 'editNode',
							node_id: node.id,
							parent_id: node.parentNode.id,
							order: this.getParentOrder(node)
						}
					});
					this.setBottomPath(node);
				}
			}
		});

	}, this);
