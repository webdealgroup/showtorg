	this.tabs[this.z].on('contextmenu', function(node,event) {

		this.tabs[this.z].getSelectionModel().select(node);
		this.setBottomPath(node);

		var items = [];

		if (node.id != 0)		// не показывать пункт меню для главной страницы
		items[items.length] = {
			id: 'change_url',
			text: 'Изменить URL',
			handler: function() {

				Ext.Msg.show({
					animEl: node.getUI().getTextEl(),
					closable: false,
					modal: false,
					title: 'Ввод URL',
					msg: 'URL для раздела &laquo;'+ node.text +'&raquo;:',
					width: 300,
					prompt: true,
					buttons: Ext.MessageBox.OKCANCEL,
					value: node.attributes.name,
					scope: this,
					fn: function(btn, text){
						if (btn == 'ok' && text){
							
							Ext.Ajax.request({
								scope: this,
								waitMsg: 'Сохранение...',
								url: './?page=templates',
								method: 'POST',
								params: {
									table: 'templates',
									task: 'editURL',
									node_id: node.id,
									parent_id: node.parentNode.id,
									name: text
								},
								callback:function(options,success,response) {
									if (!success) return;
									var responseData = Ext.util.JSON.decode(response.responseText);
									if (responseData.success) {
										node.attributes.name = responseData.name;
										this.setBottomPath(node);
									} else {
										Ext.Msg.show({
											animEl: false,
											closable: false,
											buttons: Ext.MessageBox.OK,
											modal: false,
											title: 'Ошибка',
											msg: responseData.message ? responseData.message : 'Ошибка сохранения!',
											scope: this
										});
									}
								}
							});

						}
					}
				});
			},
			scope: this
		};

		items[items.length] = {
			text: 'Редактировать',
			handler : function() { this.addEditTab(node); },
			scope: this,
         iconCls: 'add'
		};

		if (node.id != 0) {

			items[items.length] = {
				text: 'Удалить',
				handler : function() { this.removeNode(node); },
				scope: this,
	         iconCls: 'remove'
			};
		}


					var templ = [];
					var templates = [ "index.tpl", "main.tpl" ];
					
					for (var i=0; i < templates.length; i++) {
						templ[templ.length] = {
							text: templates[i],
							handler:
								function(item,checked) {
									if (checked) 
									  this.updateTemplate(node, item.initialConfig.text, item);
						 		},
							scope: this,
							checked: node.attributes.tpl == templates[i] ? true : false,
							group: 'tplmenu'
						};
					}	

					items[items.length] = {
						text: 'Шаблон',
	       		 	 	iconCls: 'plugin',
						menu: {
							items : templ
						}
					};



				var contextMenu = new Ext.menu.Menu({items:items}).show(node.getUI().getIconEl());


	}, this);
