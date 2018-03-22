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
								url: './?page=articles',
								method: 'POST',
								params: {
									table: 'articles',
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
            id: 'change_short_text',
			text: 'Редактировать краткое описание статьи',
			handler : function() { 
                        if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
                        if (!this.tabs['edit_short_node'+node.id]) {
                            this.tabs['edit_short_node'+node.id] = new Ext.Panel({
                                html: '<iframe src="./?page=articles&action=edit&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>',
                                    frame:false,
                                    title: 'Кратко - '+node.text.substring(0, 10)+'..',//node.text,
                                    closable: true,
                                    autoDestroy: true,
                                    autoWidth: true,
                                    autoShow: true
                            });
                        }
                        this.area.add(this.tabs['edit_short_node'+node.id]).show();
                    },
			scope: this,
         iconCls: 'add'
		};
        
		items[items.length] = {
            id: 'change_long_text',
			text: 'Редактировать статью полностью',
			handler : function() { 
                
                        if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
                        if (!this.tabs['edit_long_node'+node.id]) {
                            this.tabs['edit_long_node'+node.id] = new Ext.Panel({
                                html: '<iframe src="./?page=articles&action=edit2&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>',
                                    frame:false,
                                    title: 'Статья - '+node.text.substring(0, 10)+'..',//node.text,
                                    closable: true,
                                    autoDestroy: true,
                                    autoWidth: true,
                                    autoShow: true
                            });
                        } 
                        this.area.add(this.tabs['edit_long_node'+node.id]).show();
                    },
			scope: this,
            iconCls: 'add'
		};


        
		items[items.length] = {
            id: 'change_img',
			text: 'Редактировать изображение',
			handler : function() { 
                
                        if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
                        if (!this.tabs['edit_img'+node.id]) {
                            this.tabs['edit_img'+node.id] = new Ext.Panel({
                                html: '<iframe src="./?page=articles&action=edit3&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>',
                                    frame:false,
                                    title: 'Статья - '+node.text.substring(0, 10)+'..',//node.text,
                                    closable: true,
                                    autoDestroy: true,
                                    autoWidth: true,
                                    autoShow: true
                            });
                        } 
                        this.area.add(this.tabs['edit_img'+node.id]).show();
                    },
			scope: this,
            iconCls: 'add'
		};
        
        
		if (node.id != 0) {
            
			items[items.length] = {
                id: 'delete_article',
				text: 'Удалить',
				handler : function() { this.removeNode(node); },
				scope: this,
	         iconCls: 'remove'
			};
		}

					var templ = [];
					var templates = [ 
                        ~~mod mod_name="list_engine_templates" action=""~
                    ];

					
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
