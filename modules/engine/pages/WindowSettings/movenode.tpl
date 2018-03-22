	this.tabs[this.z].on('movenode', function(tree, node, oldParent, newParent, index) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=pages',
			params: {
				table: 'pages',
				task: 'saveOrder',
				node_id: node.id,
				parent_id: newParent.id,
				order: this.getParentOrder(node)
			},
			callback: function(options,success,response) {
				var responseData = Ext.util.JSON.decode(response.responseText);
				if (responseData.success) return;
				if (responseData.message) {
					Ext.Msg.show({
						animEl: false,
						closable: false,
						buttons: Ext.MessageBox.OK,
						modal: false,
						title: 'Замечание',
						msg: responseData.message ? responseData.message : 'Ошибка сохранения!',
						scope: this
					});
					node.attributes.name = responseData.name;
					node.name = node.attributes.name;
					this.setBottomPath(node);
				}
			}
		});
		this.setBottomPath(node);
	}, this);
