Ext.BLANK_IMAGE_URL = '/god/images/s.gif'; 

MyDesktop = new Ext.app.App({
	init :function(){
		Ext.QuickTips.init();
    },

	getModules : function(){
		return [
                
			new MyDesktop.Windows.modules(),                
			new MyDesktop.Windows.pages(),                
			new MyDesktop.Windows.templates(),                
			new MyDesktop.Windows.tree()                    
		];
	},

	activeModule : function() {
		return this.getModule(this.desktop.getActiveWindowId()+'-win');
	},

	getStartConfig : function(){
		return {
			title: '',
			iconCls: 'user',
			toolItems: [{
				text:'Настройки',
				iconCls:'settings',
				handler: function() { this.getModule('settings-win').createWindow(); },
				scope:this
			},'-',{
				text:'Выход',
				iconCls:'logout',
				scope:this,
				handler: function() { window.location = './logout/'; }
			}]
		};
	},
	Windows : {}
});


        
MyDesktop.Windows.modules = Ext.extend(Ext.app.Module, new function() {

	this.name = 'modules';
	this.windowname = this.name + '-win';
	this.id = this.name + '-win';
	this.tabs = [];
	this.activeTabNo = 0;
	this.items = [];
	this.win = null;
	this.activeWindow = '';
	this.launcher = false;

	this.getModsMenu = function(node)
	{
    
					var templ = [];
					var templates = [ 
                         "index", 
"footer", 
"51", 
"* no template"
                    ];

					
					for (var i=0; i < templates.length; i++) {
						templ[templ.length] = {
							text: templates[i],
							handler:
								function(item,checked) {
									if (checked)
                                    {
                                        //this.updateTemplate(node, item.initialConfig.text, item);
                                        var node = this.tabs[this.z].root.appendChild(new Ext.tree.TreeNode({
                                            allowDrag:true
                                        }));
                                        node.parentNode.expand(false,false);
                                        this.tabs[this.z].getSelectionModel().select(node);
                                        setTimeout(function(){
                                        
                                            var ge = new Ext.tree.TreeEditor(tab, {
                                                allowBlank:false,
                                                blankText:'Укажите название!',
                                                selectOnFocus:true,
                                                autosize: true,
                                                cancelOnEsc: true,
                                                completeOnEnter: true,
                                                ignoreNoChange: true
                                            });
                                            
                                            ge.editNode = node;
                                            ge.startEdit(node.ui.textNode, '');
                                            
                                            node.attributes.tpl = item.initialConfig.text;

/*
                                            Ext.Ajax.request({
                                                scope: this,
                                                url: './?page=modules',
                                                method: 'POST',
                                                params: {
                                                    table: 'modules',
                                                    task: 'update',
                                                    key: 'id',
                                                    keyID: node.id,
                                                    field: 'tpl',
                                                    value: item.initialConfig.text
                                                },
                                                success:function(response,options) {
                                                    node.attributes.tpl = item.initialConfig.text;
                                                    //item.setChecked(true);
                                                }
                                            });
*/


                                        }, 10);
                                    
                                    }                                    
						 		},
							scope: this,
							//checked: node.attributes.tpl == templates[i] ? true : false,
							group: 'tplmenu'
						};
					}	
                    
                    return templ;
    }


	this.setContent = function(text) {
		this.items[0].getActiveTab().html = text;
	};
	this.createWindow = function(target) {
		var desktop = this.app.getDesktop();
		this.win = desktop.getWindow(this.windowname);
		if (!this.win) {
			this.win = desktop.createWindow(this.getWindowSettings());
			this.area = this.win.getComponent(this.windowname + '-panel');
		}
		this.win.show(target?target:null);
	};
	this.addTab = function(data) {
		var n = data.href.replace(/[^0-9a-z]/gi, '');
		this.tabs[n] = this.area.add({
			title: data.title ? data.title : data.innerHTML,
			iconCls: 'tabs',
			autoLoad: { url: data.href, scope: this },
			closable:true
		}).show();
		this.tabs[n].on('activate', function(p) { p.getUpdater().refresh(); }, this);
	};
	this.loadPage = function(data) {
		this.area.getActiveTab().load({
		    url: data.href,
//		    params: {param1: "foo", param2: "bar"}, // or a URL encoded string
//		    callback: yourFunction,
		    scope: this, // optional scope for the callback
		    discardUrl: false,
		    nocache: false,
		    text: "Loading...",
		    timeout: 30,
		    scripts: false
		});
	};
	this.setContent = function(text) {
		this.items[0].getActiveTab().html = text;
	};
	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    	var bottomButton = new Ext.Toolbar.Button({
		text: this.imgInfo + ' ID: '+ this.rootID +', URL: ' + bottomText,
		handler: function() { window.open(this.siteURL + bottomText); },
		scope: this
	});
	var el = document.createElement('div');
	el.id = 'modules-div-' + this.z;
	Ext.getBody().appendChild(el);

    	this.tabs[this.z] = new Ext.tree.TreePanel({
		title: 'Структура шаблонов',
		el: 'modules-div-' + this.z,
		autoScroll:true,
		animate:true,
		enableDD:true,
		containerScroll: true,
		bodyBorder: true,
		loader: new Ext.tree.TreeLoader({
		   url: './?page=modules',
			baseParams: { task: 'getNode' }
		}),
		dropConfig:{},
		header: false,

		bbar:[bottomButton],

		tbar:[{
			text: 'Редактировать',
			handler : function() { this.addEditTab(this.tabs[this.z].getSelectionModel().getSelectedNode()); },
			scope: this,
         iconCls: 'add'
		},{
			text: 'Добавить',
			handler : function() {

				var node = this.tabs[this.z].root.appendChild(new Ext.tree.TreeNode({
					allowDrag:true
				}));
				node.parentNode.expand(false,false);
				this.tabs[this.z].getSelectionModel().select(node);
				setTimeout(function(){
					ge.editNode = node;
					ge.startEdit(node.ui.textNode, '');
				}, 10);

			},
			scope: this,
            iconCls: 'add'
		},{
				text: 'Добавить модуль',
				menu: this.getModsMenu(), //...
				scope: this,
				iconCls: 'node_module'
        },'-',{
			text: '',
			handler : function() { this.tabs[this.z].expandAll(); },
			scope: this,
            iconCls: 'folder-open'
		},{
			text: '',
			handler : function() { this.tabs[this.z].collapseAll(); this.tabs[0].getRootNode().expand(); },
			scope: this,
            iconCls: 'folder'
		}]

	});
    	this.tabs[this.z].on('click', function(node,event) {
		this.setBottomPath(node);
	}, this);
    	this.tabs[this.z].on('movenode', function(tree, node, oldParent, newParent, index) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=modules',
			params: {
				table: 'modules',
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
    	this.tabs[this.z].on('textchange', function(node,newText,oldText) {

		if (newText == oldText) return;

		if (newText == '') {
			node.remove();
			return Ext.MessageBox.alert('Ошибка','Вы должны указать название для раздела.');
		}

		Ext.Ajax.request({
			scope: this,
			waitMsg: 'Сохранение...',
			url: './?page=modules',
			method: 'POST',
			params: {
				table: 'modules',
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
						url: './?page=modules',
						method: 'POST',
						params: {
							table: 'modules',
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
								url: './?page=modules',
								method: 'POST',
								params: {
									table: 'modules',
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
					var templates = [ 
                        "index", 
"footer", 
"51", 
"* no template"
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
    
    	this.getParentOrder = function(node) {
		var order = [];
		node.parentNode.eachChild(function(node) {
			order[order.length] = node.id;
		});
		return Ext.encode(order);
	};    
    	this.setBottomPath = function(node) {
		bottomText = this.getNodePath(node);
		bottomButton.setText(this.imgInfo+ ' ID: '+ node.id +', URL: '+ bottomText);
	};    
    	this.getNodePath = function(node, index) {
		index = index ? index : 'name';
		var path = node.getPath(index)+'/';
		return path.replace('/index/','/');
	};    
    	this.addEditTab = function(node) {
		if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		if (!this.tabs['editnode'+node.id]) {
			this.tabs['editnode'+node.id] = new Ext.Panel({
				html: '<iframe src="./?page=modules&action=edit&tpl='+node.attributes.tpl+'" style="width:100%; height:100%; border:0px;"></iframe>',
					frame:false,
					title: node.text,
					closable: true,
					autoDestroy: true,
					autoWidth: true,
					autoShow: true
			});
		}
		this.area.add(this.tabs['editnode'+node.id]).show();
	};
    
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
    	this.updateTemplate = function(node,tpl,item) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=modules',
			method: 'POST',
			params: {
				table: 'modules',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'tpl',
				value: tpl
			},
			success:function(response,options) {
				node.attributes.tpl = item.initialConfig.text;
				item.setChecked(true);
			}
		});
	};
    
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
	var ge = new Ext.tree.TreeEditor(this.tabs[this.z], {
		allowBlank:false,
		blankText:'Укажите название!',
		selectOnFocus:true,
		autosize: true,
		cancelOnEsc: true,
		completeOnEnter: true,
		ignoreNoChange: true
	});

	this.tabs[this.z].root = new Ext.tree.AsyncTreeNode({
		text: 'Сайт',
		draggable: false,
		id: this.rootID,
		name: 'site',
		tpl: 'site.tpl',
		status: 1
	});
	this.tabs[this.z].setRootNode(this.tabs[this.z].root);


	this.tabs[this.z].render();
	this.tabs[this.z].root.expand(false,false);
	tab = this.tabs[this.z];



		this.items[0] = new Ext.TabPanel({
			id: this.windowname + '-panel',
			activeTab: 0,
			enableTabScroll:true,
			items: this.tabs
		});

    		return {
			id: this.windowname,
			title: 'Шаблоны',
			width: 800,
			height: 500,
			iconCls: 'icon-grid',
			shim: false,
			animCollapse: true,
//			collapsible: true,
			constrainHeader: true,
			layout: 'fit',
			autoDestroy: true,
			titleCollapse: true,
			enableTabScroll:true,
			defaults: {autoScroll:true,bodyStyle:'padding:0px;'},
			items: this.items,
			tools:[{
				id: 'refresh',
				hidden: false,
				handler: function(event, toolEl, p) {
					var tab = this.area.getActiveTab();
					switch(tab.getXType()) {
						case 'editorgrid': tab.getStore().reload(); break;
						case 'grid': tab.getStore().reload(); break;
						case 'treepanel': tab.root.reload(); break;
						default: tab.getUpdater().refresh();
					}
				},
				scope: this
			}]
		};
	};

});

        
MyDesktop.Windows.pages = Ext.extend(Ext.app.Module, new function() {

	this.name = 'pages';
	this.windowname = this.name + '-win';
	this.id = this.name + '-win';
	this.tabs = [];
	this.activeTabNo = 0;
	this.items = [];
	this.win = null;
	this.activeWindow = '';
	this.launcher = false;

	this.init = function() {
		this.launcher = {
			text: 'Страницы',
			iconCls: 'icon-grid',
			handler : this.createWindow,
			scope: this
		};
	};
	this.createWindow = function(target) {
		var desktop = this.app.getDesktop();
		this.win = desktop.getWindow(this.windowname);
		if (!this.win) {
			this.win = desktop.createWindow(this.getWindowSettings());
			this.area = this.win.getComponent(this.windowname + '-panel');
		}
		this.win.show(target?target:null);
	};
	this.addTab = function(data) {
		var n = data.href.replace(/[^0-9a-z]/gi, '');
		this.tabs[n] = this.area.add({
			title: data.title ? data.title : data.innerHTML,
			iconCls: 'tabs',
			autoLoad: { url: data.href, scope: this },
			closable:true
		}).show();
		this.tabs[n].on('activate', function(p) { p.getUpdater().refresh(); }, this);
	};
	this.loadPage = function(data) {
		this.area.getActiveTab().load({
		    url: data.href,
//		    params: {param1: "foo", param2: "bar"}, // or a URL encoded string
//		    callback: yourFunction,
		    scope: this, // optional scope for the callback
		    discardUrl: false,
		    nocache: false,
		    text: "Loading...",
		    timeout: 30,
		    scripts: false
		});
	};
	this.setContent = function(text) {
		this.items[0].getActiveTab().html = text;
	};
	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    	var bottomButton = new Ext.Toolbar.Button({
		text: this.imgInfo + ' ID: '+ this.rootID +', URL: ' + bottomText,
		handler: function() { window.open(this.siteURL + bottomText); },
		scope: this
	});
	var el = document.createElement('div');
	el.id = 'pages-div-' + this.z;
	Ext.getBody().appendChild(el);

    	this.tabs[this.z] = new Ext.tree.TreePanel({
		title: 'Все модули',
		el: 'pages-div-' + this.z,
		autoScroll:true,
		animate:true,
		enableDD:true,
		containerScroll: true,
		bodyBorder: true,
		loader: new Ext.tree.TreeLoader({
		   url: './?page=pages',
			baseParams: { task: 'getNode' }
		}),
		dropConfig:{},
		header: false,

		bbar:[bottomButton],

		tbar:[{
			text: 'Редактировать',
			handler : function() { this.addEditTab(this.tabs[this.z].getSelectionModel().getSelectedNode()); },
			scope: this,
         iconCls: 'add'
		},{
			text: 'Добавить страницу',
			handler : function() {

				var node = this.tabs[this.z].root.appendChild(new Ext.tree.TreeNode({
					allowDrag:true
				}));
				node.parentNode.expand(false,false);
				this.tabs[this.z].getSelectionModel().select(node);
				setTimeout(function(){
					ge.editNode = node;
					ge.startEdit(node.ui.textNode, '');
				}, 10);

			},
			scope: this,
         iconCls: 'add'
		},'-',{
			text: 'Развернуть все',
			handler : function() { this.tabs[this.z].expandAll(); },
			scope: this,
         iconCls: 'folder-open'
		},{
			text: 'Свернуть все',
			handler : function() { this.tabs[this.z].collapseAll(); this.tabs[0].getRootNode().expand(); },
			scope: this,
         iconCls: 'folder'
		}]

	});    
    	this.tabs[this.z].on('click', function(node,event) {
		this.setBottomPath(node);
	}, this);    
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
    	this.tabs[this.z].on('textchange', function(node,newText,oldText) {

		if (newText == oldText) return;

		if (newText == '') {
			node.remove();
			return Ext.MessageBox.alert('Ошибка','Вы должны указать название для раздела.');
		}

		Ext.Ajax.request({
			scope: this,
			waitMsg: 'Сохранение...',
			url: './?page=pages',
			method: 'POST',
			params: {
				table: 'pages',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'title',
				value: newText
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
						url: './?page=pages',
						method: 'POST',
						params: {
							table: 'pages',
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
								url: './?page=pages',
								method: 'POST',
								params: {
									table: 'pages',
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
    
    	this.getParentOrder = function(node) {
		var order = [];
		node.parentNode.eachChild(function(node) {
			order[order.length] = node.id;
		});
		return Ext.encode(order);
	};    
    	this.setBottomPath = function(node) {
		bottomText = this.getNodePath(node);
		bottomButton.setText(this.imgInfo+ ' ID: '+ node.id +', URL: '+ bottomText);
	};    
    	this.getNodePath = function(node, index) {
		index = index ? index : 'name';
		var path = node.getPath(index)+'/';
		return path.replace('/index/','/');
	};    
    	this.addEditTab = function(node) {
		if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		if (!this.tabs['editnode'+node.id]) {
			this.tabs['editnode'+node.id] = new Ext.Panel({
				html: '<iframe src="./?page=pages&action=edit&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>',
					frame:false,
					title: node.text,
					closable: true,
					autoDestroy: true,
					autoWidth: true,
					autoShow: true
			});
		}
		this.area.add(this.tabs['editnode'+node.id]).show();
	};    
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
					url: './?page=pages',
					method: 'POST',
					params: {
						table: 'pages',
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
    	this.updateTemplate = function(node,tpl,item) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=pages',
			method: 'POST',
			params: {
				table: 'pages',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'tpl',
				value: tpl
			},
			success:function(response,options) {
				node.attributes.tpl = item.initialConfig.text;
				item.setChecked(true);
			}
		});
	};
    
    	this.updateStatus = function(node, item) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=pages',
			method: 'POST',
			params: {
				table: 'pages',
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
	var ge = new Ext.tree.TreeEditor(this.tabs[this.z], {
		allowBlank:false,
		blankText:'Укажите название!',
		selectOnFocus:true,
		autosize: true,
		cancelOnEsc: true,
		completeOnEnter: true,
		ignoreNoChange: true
	});

	this.tabs[this.z].root = new Ext.tree.AsyncTreeNode({
		text: 'Главная',
		draggable: false,
		id: this.rootID,
		name: 'index',
		tpl: 'index.tpl',
		status: 1
	});
	this.tabs[this.z].setRootNode(this.tabs[this.z].root);

	this.tabs[this.z].render();
	this.tabs[this.z].root.expand(false,false);
	tab = this.tabs[this.z];

		this.items[0] = new Ext.TabPanel({
			id: this.windowname + '-panel',
			activeTab: 0,
			enableTabScroll:true,
			items: this.tabs
		});

    		return {
			id: this.windowname,
			title: 'Структура страниц',
			width: 800,
			height: 500,
			iconCls: 'icon-grid',
			shim: false,
			animCollapse: true,
//			collapsible: true,
			constrainHeader: true,
			layout: 'fit',
			autoDestroy: true,
			titleCollapse: true,
			enableTabScroll:true,
			defaults: {autoScroll:true,bodyStyle:'padding:0px;'},
			items: this.items,
			tools:[{
				id: 'refresh',
				hidden: false,
				handler: function(event, toolEl, p) {
					var tab = this.area.getActiveTab();
					switch(tab.getXType()) {
						case 'editorgrid': tab.getStore().reload(); break;
						case 'grid': tab.getStore().reload(); break;
						case 'treepanel': tab.root.reload(); break;
						default: tab.getUpdater().refresh();
					}
				},
				scope: this
			}]
		};    
	};

});

        
MyDesktop.Windows.templates = Ext.extend(Ext.app.Module, new function() {

	this.name = 'templates';
	this.windowname = this.name + '-win';
	this.id = this.name + '-win';
	this.tabs = [];
	this.activeTabNo = 0;
	this.items = [];
	this.win = null;
	this.activeWindow = '';
	this.launcher = false;

	this.init = function() {
		this.launcher = {
			text: 'Модули',
			iconCls: 'icon-grid',
			handler : this.createWindow,
			scope: this
		};
	};
	this.createWindow = function(target) {
		var desktop = this.app.getDesktop();
		this.win = desktop.getWindow(this.windowname);
		if (!this.win) {
			this.win = desktop.createWindow(this.getWindowSettings());
			this.area = this.win.getComponent(this.windowname + '-panel');
		}
		this.win.show(target?target:null);
	};
	this.addTab = function(data) {
		var n = data.href.replace(/[^0-9a-z]/gi, '');
		this.tabs[n] = this.area.add({
			title: data.title ? data.title : data.innerHTML,
			iconCls: 'tabs',
			autoLoad: { url: data.href, scope: this },
			closable:true
		}).show();
		this.tabs[n].on('activate', function(p) { p.getUpdater().refresh(); }, this);
	};
	this.loadPage = function(data) {
		this.area.getActiveTab().load({
		    url: data.href,
//		    params: {param1: "foo", param2: "bar"}, // or a URL encoded string
//		    callback: yourFunction,
		    scope: this, // optional scope for the callback
		    discardUrl: false,
		    nocache: false,
		    text: "Loading...",
		    timeout: 30,
		    scripts: false
		});
	};
	this.setContent = function(text) {
		this.items[0].getActiveTab().html = text;
	};
	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    	var bottomButton = new Ext.Toolbar.Button({
		text: this.imgInfo + ' ID: '+ this.rootID +', URL: ' + bottomText,
		handler: function() { window.open(this.siteURL + bottomText); },
		scope: this
	});
	var el = document.createElement('div');
	el.id = 'templates-div-' + this.z;
	Ext.getBody().appendChild(el);

    	this.tabs[this.z] = new Ext.tree.TreePanel({
		title: 'Все модули',
		el: 'templates-div-' + this.z,
		autoScroll:true,
		animate:true,
		enableDD:true,
		containerScroll: true,
		bodyBorder: true,
		loader: new Ext.tree.TreeLoader({
		   url: './?page=templates',
			baseParams: { task: 'getNode' }
		}),
		dropConfig:{},
		header: false,

		bbar:[bottomButton],

		tbar:[{
			text: 'Редактировать',
			handler : function() { this.addEditTab(this.tabs[this.z].getSelectionModel().getSelectedNode()); },
			scope: this,
         iconCls: 'add'
		},{
			text: 'Добавить модуль',
			handler : function() {

				var node = this.tabs[this.z].root.appendChild(new Ext.tree.TreeNode({
					allowDrag:true
				}));
				node.parentNode.expand(false,false);
				this.tabs[this.z].getSelectionModel().select(node);
				setTimeout(function(){
					ge.editNode = node;
					ge.startEdit(node.ui.textNode, '');
				}, 10);

			},
			scope: this,
         iconCls: 'add'
		},'-',{
			text: 'Развернуть все',
			handler : function() { this.tabs[this.z].expandAll(); },
			scope: this,
         iconCls: 'folder-open'
		},{
			text: 'Свернуть все',
			handler : function() { this.tabs[this.z].collapseAll(); this.tabs[0].getRootNode().expand(); },
			scope: this,
         iconCls: 'folder'
		}]

	});    
    	this.tabs[this.z].on('click', function(node,event) {
		this.setBottomPath(node);
	}, this);    
    	this.tabs[this.z].on('movenode', function(tree, node, oldParent, newParent, index) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=templates',
			params: {
				table: 'templates',
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
    	this.tabs[this.z].on('textchange', function(node,newText,oldText) {

		if (newText == oldText) return;

		if (newText == '') {
			node.remove();
			return Ext.MessageBox.alert('Ошибка','Вы должны указать название для раздела.');
		}

		Ext.Ajax.request({
			scope: this,
			waitMsg: 'Сохранение...',
			url: './?page=templates',
			method: 'POST',
			params: {
				table: 'templates',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'title',
				value: newText
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
						url: './?page=templates',
						method: 'POST',
						params: {
							table: 'templates',
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
    
    	this.getParentOrder = function(node) {
		var order = [];
		node.parentNode.eachChild(function(node) {
			order[order.length] = node.id;
		});
		return Ext.encode(order);
	};    
    	this.setBottomPath = function(node) {
		bottomText = this.getNodePath(node);
		bottomButton.setText(this.imgInfo+ ' ID: '+ node.id +', URL: '+ bottomText);
	};    
    	this.getNodePath = function(node, index) {
		index = index ? index : 'name';
		var path = node.getPath(index)+'/';
		return path.replace('/index/','/');
	};    
    	this.addEditTab = function(node) {
		if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		if (!this.tabs['editnode'+node.id]) {
			this.tabs['editnode'+node.id] = new Ext.Panel({
				html: '<iframe src="./?page=templates&action=edit&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>',
					frame:false,
					title: node.text,
					closable: true,
					autoDestroy: true,
					autoWidth: true,
					autoShow: true
			});
		}
		this.area.add(this.tabs['editnode'+node.id]).show();
	};    
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
    	this.updateTemplate = function(node,tpl,item) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=templates',
			method: 'POST',
			params: {
				table: 'templates',
				task: 'update',
				key: 'id',
				keyID: node.id,
				field: 'tpl',
				value: tpl
			},
			success:function(response,options) {
				node.attributes.tpl = item.initialConfig.text;
				item.setChecked(true);
			}
		});
	};
    
    	this.updateStatus = function(node, item) {
		Ext.Ajax.request({
			scope: this,
			url: './?page=templates',
			method: 'POST',
			params: {
				table: 'templates',
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
	var ge = new Ext.tree.TreeEditor(this.tabs[this.z], {
		allowBlank:false,
		blankText:'Укажите название!',
		selectOnFocus:true,
		autosize: true,
		cancelOnEsc: true,
		completeOnEnter: true,
		ignoreNoChange: true
	});

	this.tabs[this.z].root = new Ext.tree.AsyncTreeNode({
		text: 'Главная',
		draggable: false,
		id: this.rootID,
		name: 'index',
		tpl: 'index.tpl',
		status: 1
	});
	this.tabs[this.z].setRootNode(this.tabs[this.z].root);


	this.tabs[this.z].render();
	this.tabs[this.z].root.expand(false,false);
	tab = this.tabs[this.z];

		this.items[0] = new Ext.TabPanel({
			id: this.windowname + '-panel',
			activeTab: 0,
			enableTabScroll:true,
			items: this.tabs
		});

    		return {
			id: this.windowname,
			title: 'Модули',
			width: 800,
			height: 500,
			iconCls: 'icon-grid',
			shim: false,
			animCollapse: true,
//			collapsible: true,
			constrainHeader: true,
			layout: 'fit',
			autoDestroy: true,
			titleCollapse: true,
			enableTabScroll:true,
			defaults: {autoScroll:true,bodyStyle:'padding:0px;'},
			items: this.items,
			tools:[{
				id: 'refresh',
				hidden: false,
				handler: function(event, toolEl, p) {
					var tab = this.area.getActiveTab();
					switch(tab.getXType()) {
						case 'editorgrid': tab.getStore().reload(); break;
						case 'grid': tab.getStore().reload(); break;
						case 'treepanel': tab.root.reload(); break;
						default: tab.getUpdater().refresh();
					}
				},
				scope: this
			}]
		};    
	};

});

        
MyDesktop.Windows.tree = Ext.extend(Ext.app.Module, new function() {

	this.name = 'tree';                            // имя объекта
	this.windowname = this.name + '-win';          // имя окна
	this.id = this.name + '-win';                  // id объекта
	this.items = [];                               // массив вложенных объектов 
	this.win = null;                               // принадлежность окна
	this.activeWindow = '';
	this.launcher = false;

	this.init = function() {
		this.launcher = {
			text: 'Структура сайта',
			iconCls: 'icon-grid',
			handler : this.createWindow,
			scope: this
		};
	};

 	this.createWindow = function(target) {
		var desktop = this.app.getDesktop();
		this.win = desktop.getWindow(this.windowname);
		if (!this.win) {
			this.win = desktop.createWindow(this.getWindowSettings());
			this.area = this.win.getComponent(this.windowname + '-panel');
		}
		this.win.show(target?target:null);
	};

	this.getWindowSettings = function() {
		

/*** items  new ************************************************/	

		var grid = {};
		var primaryKey = 'id';
		var tableName = 'items';
		
		var editShortDescription = function() {
        
            var node = grid.selModel.selections.items[0].data.id;

			if (!node) return Ext.MessageBox.alert('Ошибка','Выделите товар для редактирования.');
		    var win;
            if(!win){
	            win = new Ext.Window({
	 				applyTo     : null,
	                layout      : 'fit',
	                width       : 850,
	                height      : 470,
	                closeAction :'hide',
	                //plain       : true,
	                html: '<iframe src="./?page=item&action=edit_short&id='+node+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            });
        	}
        	win.show();
		};
		var editLongDescription = function() {
        
            var node = grid.selModel.selections.items[0].data.id;

			if (!node) return Ext.MessageBox.alert('Ошибка','Выделите товар для редактирования.');
		    var win;
            if(!win){
	            win = new Ext.Window({
	 				applyTo     : null,
	                layout      : 'fit',
	                width       : 850,
	                height      : 470,
	                closeAction :'hide',
	                //plain       : true,
	                html: '<iframe src="./?page=item&action=edit_long&id='+node+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            });
        	}
        	win.show();
		};
		var deleteRecord = function(btn) {
			if (btn == 'yes') {
				var selectedRows = grid.selModel.selections.items;
				var selectedKeys = Ext.encode(grid.selModel.selections.keys);

				Ext.Ajax.request({
					scope: this,
					waitMsg: 'Удаление...',
					url: './?page=items',
					params: {
						table: "items",
						task: "delete",
						rows: selectedKeys,
						key: primaryKey
					},
					callback: function (options, success, response) {
						if (success) { //success will be true if the request succeeded
							var json = Ext.util.JSON.decode(response.responseText);
							//Ext.MessageBox.alert('OK', 'Удалено записей: ' + json.del_count);
						} else {
							Ext.MessageBox.alert('OK',response.responseText);//you won't see this alert if the next one pops up fast
							Ext.MessageBox.alert('Произошла ошибка',response.responseText);
						}
					},
					failure:function(response,options){
						Ext.MessageBox.alert('Внимание!','Произошла ошибка при выполнении запроса');
						grid_store.rejectChanges();
					},                                      
					success:function(response,options){
						//Ext.MessageBox.alert('Success','Yeah...');
						grid_store.reload();
					}                                      
				});
				
				//grid.getStore().removeAll(); 
				//grid.getStore().reload();
			};

		};
		var updateRecord = function(gridEvent) {

			if (gridEvent.value instanceof Date) {
				var fieldValue = gridEvent.value.format('Y-m-d H:i:s');
			} else {
				var fieldValue = gridEvent.value;
			}
			
			//Ext.MessageBox.alert('', my_tree.getSelectionModel().getSelectedNode().id + "  " + fieldValue);
			
			Ext.Ajax.request({
				scope: this,
				waitMsg: 'Сохранение...',
				url: './?page=items',
				method: 'POST',
				params: {
					table: "items",
					task: "update",
					key: "id",
					keyID: gridEvent.record.data[primaryKey],
					field: gridEvent.field,
					value: fieldValue,
					originalValue: gridEvent.record.modified,
					field_node: "node",
					value_node: my_tree.getSelectionModel().getSelectedNode().id

				},
				failure: function(response,options){
					Ext.MessageBox.alert('Warning','Запись не сохранена');
					//ds.rejectChanges();//undo any changes
				},

				success:function(response,options) {

					var responseData = Ext.util.JSON.decode(response.responseText);
					
					if (gridEvent.record.data[primaryKey] == null) {
						var newID = responseData.newID;
						var newNode = responseData.newNode;
						gridEvent.record.set('newRecord','no');
						gridEvent.record.set(primaryKey,newID);
						gridEvent.record.set('node',newNode);
						grid_store.commitChanges();
					} else {
						grid_store.commitChanges();
					}
					//Ext.MessageBox.alert('Готово', response.responseText);
				}

			});

		};
        function title_img(val, x, grid_store){
        
            var node = my_tree.getSelectionModel().getSelectedNode();
            var path = node.id; //node.getPath();
            //path = path.replace('/1/', '/');
            
            //var pattern = /\r\n|\r|\n/g;
            //var new_pattern = grid_store.data.param.replace(pattern, "<br>");

            return '<img src="../get_image.php?file=/' + path + '/' + grid_store.data.image + '&width=40&height=40" align="left">' +
            '<b style="font-size: 11px;">' +val +
            '</b><br />' +
            'Каткое описание:<font color=\'green\'>' +
            grid_store.data.param +
            '</font><br />Полное описание:<font color=\'green\'>'+
            grid_store.data.descr +
            '</font>';//+store.data.tagline;
        }
        var grid_store = new Ext.data.Store({
//			autoLoad: true,
			proxy: new Ext.data.HttpProxy({
				url: './?page=items',
				method: 'POST',
				text: 'Loading...'
			}),
			baseParams: {
				table: 'items',
				task: "getData",
				sort: "hide DESC, sort ASC",
				key: 'id',
				columns: 'id,node,name,url,param,descr,cost,type,sort,hide'
			},
			reader: new Ext.data.JsonReader(),
			remoteSort: true
		});

		//grid_store.load();
		var newRecord = Ext.data.Record.create(grid_store.reader.meta);	

        var checkColumn1 = new Ext.grid.CheckColumn({
           header: "Отобразить",
           dataIndex: 'hide',
           editable: true,
           width: 70
        });
        var checkColumn2 = new Ext.grid.CheckColumn({
           header: "Новый",
           dataIndex: 'young',
           editable: true,
           width: 50
        });
		var grid = new Ext.grid.EditorGridPanel({
			renderTo: Ext.getBody(),
			enableDragDrop : true,
			ddGroup : 'mygrid-dd',  
			ddText : 'Расположить эту строку',
			//frame:true,
			//title: '',
			//autoHeight: true, //height:100,
			//autoWidth: true, //width:100,
			header: false,
			autoScroll: true,

			tbar:[
			{
				text: '',
				handler : 
					function() {
						/*Ext.MessageBox.alert('Внимание',my_tree.getSelectionModel().getSelectedNode().id);*/
						
						if (my_tree.getSelectionModel().getSelectedNode().id) {
							grid.stopEditing();
							grid_store.add(new newRecord({
								id: "",
								node: "",
								name: "",
                                url: "",
								param: "",
								cost: "",
								qty: "",
                                type: "",
                                hide: 1,
								young: 0
							})); //my_tree.getSelectionModel().getSelectedNode().id
							//tabl.startEditing(0, 0);
						}
						else 
						{
							Ext.MessageBox.alert('Внимание',"Не выбран узел");
						}
					},
				scope: this,
            	iconCls: 'add'
			},
			'-'	,
			{
				text:'',
				handler: 
					function() {
						var selectedKeys = grid.selModel.selections.keys; 
						if (selectedKeys.length > 0) {
							Ext.MessageBox.confirm('Внимание','Вы точно хотите удалить выделенные записи?', deleteRecord, this);
						} 
						else 
						{
							Ext.MessageBox.alert('Внимание','Выделите хотя бы одну запись для удаления');
						}
					},
				scope: this,
            	iconCls: 'remove'
			},
			'-'	,
			{
				text:'Краткое описание',
				handler: editShortDescription,
				scope: this,
            	iconCls: 'document_edit'
			},
			'-'	,
			{
				text:'Полное описание',
				handler: editLongDescription,
				scope: this,
            	iconCls: 'document_edit'
			},
			'-'	,
			{
				text:'Обновить',
				handler: function(){
        			grid.getStore().removeAll();
        			grid.getStore().load({params:{ node: my_tree.getSelectionModel().getSelectedNode().id, start: 0, limit: 100 }});                
			        //imgs.getStore().removeAll();
			        //imgs.getStore().load({params:{ node: 0, start: 0, limit: 100 }});                    
                },
				scope: this,
            	iconCls: 'table_refresh'
			}],
            
       
            plugins:[checkColumn1,checkColumn2],
			store: grid_store,
            clicksToEdit: 2, 
			autoExpandColumn: 'title',
			columns: [
              {dataIndex:'id',width: 70,align :'right',header:'ID', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'node',width: 70,align :'right',header:'Раздел', editor:new Ext.form.TextField({allowBlank:false}) },
		      {header: "Наименование", dataIndex: 'name', renderer: title_img, id: 'title', sortable: true, editor:new Ext.form.TextField({allowBlank:false})},
              {dataIndex:'url',width: 170,align :'left',header:'URL', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'cost',width: 70,align :'right',header:'Цена', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'qty',width: 70,align :'right',header:'Наличие', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'type',width: 70,align :'right',header:'Тип', editor:new Ext.form.TextField({allowBlank:false}) },
              checkColumn1,
			  checkColumn2
		    ],
			sm: new Ext.grid.RowSelectionModel({  
			    singleSelect:true,  
			    listeners: {  
			        beforerowselect: function(sm,i,ke,row){  
			            grid.ddText = title_img(row.data.name, null, row);  
			        }  
			    }  
			}) 
		 });
		grid.addListener('afteredit', updateRecord, this);
		//grid.addListener('click', editRecord, this);

		grid_store.on('load', function(grid_store) {
			var state = grid_store.lastOptions.params;
			grid_store.setDefaultSort( state.sort ? state.sort : null, state.dir ? state.dir : null );
		}, this, grid_store );

		var ddrow = new Ext.dd.DropTarget(grid.getView().mainBody, {  
		    ddGroup : 'mygrid-dd',  
		    notifyDrop : function(dd, e, data){  
                var order = [];
		        var sm = grid.getSelectionModel();  
		        var rows = sm.getSelections();  
		        var cindex = dd.getDragData(e).rowIndex;  
		        if (sm.hasSelection()) {  

		            for (i = 0; i < rows.length; i++) {  
		                grid_store.remove(grid_store.getById(rows[i].id));  
		                grid_store.insert(cindex,rows[i]);  
		            }  

				var i;
		        grid_store.each(function(record)  
				  {  
				      order[i] = record.get('id');
					  i++;       
				  }, this);


                    //alert(dump(order,0));


                    Ext.Ajax.request({
						scope: this,
						url: './?page=items',
						params: {
							table: 'items',
							task: 'saveOrder',
							node: data.node,
							order: Ext.encode(order)
						},
						callback: 
							function(options,success,response) {
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
								}
							}                    
                    });
                    
		            sm.selectRecords(rows);  
		        }    
		    }  
		});
/**** gallery ***********************************************/		
	

    var gallery_store = new Ext.data.JsonStore({
        url: 'get-images.php',
        root: 'images',
        fields: ['name', 'url', {name:'size', type: 'float'}, {name:'lastmod', type:'date', dateFormat:'timestamp'}]
    });
    //gallery_store.load({params:{dir:''}});
    var tpl = new Ext.XTemplate(
		'<tpl for=".">',
            '<div class="thumb-wrap" id="{name}">',
		    '<div class="thumb"><img src="../get_image.php?file=/{url}&width=100&height=100"></div>',
		    '<span class="x-noneditable">{shortName}</span></div>',
        '</tpl>',
        '<div class="x-clear"></div>'
	);
	    var gallery = new Ext.DataView({
            store: gallery_store,
            tpl: tpl,
            //autoHeight:true,
            multiSelect: true,
            overClass:'x-view-over',
            itemSelector:'div.thumb-wrap',
            emptyText: '',

            plugins: [
                new Ext.DataView.DragSelector(),
                new Ext.DataView.LabelEditor({dataIndex: 'name'})
            ],

            prepareData: function(data){
                data.shortName = Ext.util.Format.ellipsis(data.name, 15);
                data.sizeString = Ext.util.Format.fileSize(data.size);
                //data.dateString = data.lastmod.format("m/d/Y g:i a");
                return data;
            },
            
            listeners: {
            	selectionchange: {
            		fn: function(dv,nodes){
            			//var l = nodes.length;
            			//var s = l != 1 ? 's' : '';
            			//panel.setTitle('Simple DataView ('+l+' item'+s+' selected)');
						//Ext.MessageBox.alert('заголовок','текст1');
            		}
            	}
            }
        });
		gallery.on('dblclick', function(dv,nodes) {
			//Ext.MessageBox.alert('заголовок','текст');
			
						//imgs.stopEditing();
						//imgs.getStore().add(new newRecord({ node: "", name:""})); 
						//imgs.startEditing(0, 0);	
						
			var select = grid.selModel.selections.keys;
			var nodes = gallery.getSelectedRecords();
        
            
            //alert(this.dump(select[0],0));
			
            if (select[0] != '0')
			{
				Ext.Ajax.request({
					scope: this,
					waitMsg: 'Сохранение...',
					url: './index.php',
					method: 'POST',
					params: {
						table: "items",
						task: "update",
						key: "id",
						keyID: select[0],
						field: "image",
						value: nodes[0].data['name'],
						originalValue: ""//,
						//field_node: "node",
						//value_node: select[0]
					},
					failure: function(response, options){
						Ext.MessageBox.alert('Warning', 'Oops...');
					//ds.rejectChanges();//undo any changes
					},
					success: function(response, options){
						var responseData = Ext.util.JSON.decode(response.responseText);
                        
                        
                        grid.getStore().reload();
                        
						//imgs.getStore().load({
						//	params: {
						//		node: select[0],
						//		start: 0,
						//		limit: 10
						//	}
						//});       
                        
						//if (gridEvent.record.data[primaryKey] == null) {
						//	var newID = responseData.newID;
						//	gridEvent.record.set('newRecord', 'no');
						//	gridEvent.record.set(primaryKey, newID);
						//	imgs_store.commitChanges();
						//}
						//else {
						//	imgs_store.commitChanges();
						//}
					//Ext.MessageBox.alert('Готово', responseData.message);
					}
					
				});
				

			}
            else
            {
                Ext.MessageBox.alert("","Не отмечен товар");
            }            
		}, this);
    var panel = new Ext.Panel({
        id:'images-view',
        //frame:true,
        height: 170,
        autoScroll:true,
        //autoHeight:true,
            margins     : '0 0 0 0',
            cmargins    : '0 0 0 0',        
        collapsible:true,
        collapseMode:'mini',
        //layout:'fit',
        //region:'south',
        split:true,
        region:'north',
        //title:'Фотогалерея',

        tbar:
        [
			{
                				text: '',
				handler : function() {
        
		            var node = my_tree.getSelectionModel().getSelectedNode();
        			var path = node.id; //node.getPath();
            		//	path = path.replace('/1/','/');
                    //    if (path == "/1") path='';
                    //path = "/1/"+ path;
                    
					if (!node) return Ext.MessageBox.alert('Ошибка','Выделите раздел для закачки файлов.');
		    		var win;
            		if(!win){
	            		win = new Ext.Window({
	 						applyTo     : null,
	                		layout      : 'fit',
	                		width       : 480,
	                		height      : 280,
	                		closeAction :'hide',
	                		//plain       : true,
	                		html: '<iframe src="../?mod_name=upload&path=img/'+path+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            		});
        			}
        			win.show();
            		win.on('hide', function() {
                                gallery_store.removeAll();
                                gallery_store.load({params:{dir:path}});
		                    } ,this);
				},
				scope: this,
            	iconCls: 'add'			},
			'-'	,
			{
                				text:'',
				handler: 
					function() {
                        var nodes = gallery.getSelectedRecords();
                        //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
                        
						var selectedKeys = grid.selModel.selections.keys; 
						if (nodes.length > 0) {
							Ext.MessageBox.confirm('','Вы точно хотите удалить выделенные изображения?', function(){
////////////////////////////////////////////////////
                            var arr = "";
                            var node = my_tree.getSelectionModel().getSelectedNode();
        			        var path = node.id; //node.getPath();
                            //    path = path.replace('/1/','/');
                            //    if (path == "/1") path='';
                            //    path = "/1/"+ path;
                                
                            var nodes = gallery.getSelectedRecords();
                            
                                for(var i = 0, len = nodes.length; i < len; i++) {
                                    var delimeter="|";
                                    if (i==0) {delimeter = ""; arr = arr + delimeter + "/" + path + "/" + nodes[0].data['name']; continue;}
                                    arr = arr + delimeter + "/" + path + "/" + nodes[i].data['name'];
                                }
								Ext.Ajax.request({
									scope: this,
									url: '../core/ftpr.php',
									params: {
										imgs: arr
									},
									failure: function(response,options){
										Ext.MessageBox.alert('Ошибка','Ошибка удаления!');
									},
									success:function(response,options) {
                                        var node = my_tree.getSelectionModel().getSelectedNode();
        			                    var path = node.id; //node.getPath();
                                        //    path = path.replace('/1/','/');   
                                        //    if (path == "/1") path='';  
                                        //    path = "/1/"+ path;
                                        gallery_store.removeAll();
                                        gallery_store.load({params:{dir:path}});
									}
								});
                                
                            }, this);
						} 
						else 
						{
							Ext.MessageBox.alert('','Выделите хотя бы одно изображение для удаления');
						}
					},
				scope: this,
            	iconCls: 'remove'			},
			'-'	,
			{
                				text:'Применить к разделу',
				handler: 
					function() {
                        var nodes = gallery.getSelectedRecords();
                        //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
                        
						var selectedKeys = grid.selModel.selections.keys; 
						if (nodes.length > 0) {

                            var folder_img = "";
                            var node = my_tree.getSelectionModel().getSelectedNode();
                              
                            var nodes = gallery.getSelectedRecords();
                            
                            folder_img = nodes[0].data['name']; 
                            ////////////////////////////////////////////////////
                            
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=tree',
											method: 'POST',
											params: {
												table: 'tree',
												task: 'updateImage',
                                                node_id: node.id,
												name: folder_img
											},
                                            success:function(response,options) {
                                                var responseData = Ext.util.JSON.decode(response.responseText);
                                                Ext.MessageBox.alert('Сообщение','Изображение прикреплено.');
                                            }
                                            
										});                            
                            
						} 
						else 
						{
							Ext.MessageBox.alert('','Выделите изображение для прикрепления');
						}
					},
				scope: this,
            	iconCls: ''			},
			'-'	,
			{
                				text:'Применить к родительскому разделу',
				handler: 
					function() {
                        var nodes = gallery.getSelectedRecords();
                        //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
                        
						var selectedKeys = grid.selModel.selections.keys; 
						if (nodes.length > 0) {

                            var folder_img = "";
                            var node = my_tree.getSelectionModel().getSelectedNode();
                              
                            var nodes = gallery.getSelectedRecords();
                            
                            folder_img = nodes[0].data['name']; 
                            ////////////////////////////////////////////////////
                            
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=tree',
											method: 'POST',
											params: {
												table: 'tree',
												task: 'updateImage',
                                                node_id: node.parentNode.id,
												name: '../'+node.id+'/'+folder_img
											},
                                            success:function(response,options) {
                                                var responseData = Ext.util.JSON.decode(response.responseText);
                                                Ext.MessageBox.alert('Сообщение','Изображение прикреплено.');
                                            }
                                            
										});                            
                            
						} 
						else 
						{
							Ext.MessageBox.alert('','Выделите изображение для прикрепления');
						}
					},
				scope: this,
            	iconCls: ''			}],

        items: gallery
    });
	
/**** my_tree ***********************************************/		
		
		this.z = 0;
		this.siteURL = '';
		this.rootID = 1;
		this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';

		var bottomText = '/';
		var bottomButton = new Ext.Toolbar.Button({
			text: this.imgInfo + ' ID: '+ this.rootID +', URL: ' + bottomText,
			handler: function() { window.open(this.siteURL + bottomText); },
			scope: this
		});

		var el = document.createElement('div');
		el.id = 'tree-div-' + this.z;
		Ext.getBody().appendChild(el);
	
		var my_tree = new Ext.tree.TreePanel({
			
			title: 'Все страницы',
			el: 'tree-div-' + this.z,
			autoScroll:true,
			animate:true,
			enableDD:true,
			containerScroll: true,
			bodyBorder: true,

			loader: new Ext.tree.TreeLoader({
			    url: './?page=tree',
				baseParams: { task: 'getNode' }
			}),

			dropConfig:{},
			header: false,

			bbar:[bottomButton],

			tbar:[
			{
                				text: '',

				handler : 
					function() {
						var node = my_tree.root.appendChild(
							new Ext.tree.TreeNode({
								allowDrag:true
							})
						);

				node.parentNode.expand(false,false);
				my_tree.getSelectionModel().select(node);

				setTimeout(function(){
					ge.editNode = node;
					ge.startEdit(node.ui.textNode, '');
				}, 10);

			},
			scope: this,
         	iconCls: 'add'
                			},
			'-',
			{
                				text: '',
				handler : function() { my_tree.expandAll(); },
				scope: this,
         		iconCls: 'folder-open'			},
			{
                				text: '',
				handler : function() { my_tree.collapseAll(); my_tree.getRootNode().expand(); },
				scope: this,
         		iconCls: 'folder'			},
			{
                				text: 'Курс = ',
				handler : function() { 
                                //
                                
							Ext.Msg.show({
							//animEl: node.getUI().getTextEl(),
							closable: false,
							modal: false,
							title: 'Веедите новый курс',
							msg: '',
							width: 200,
							prompt: true,
							buttons: Ext.MessageBox.OKCANCEL,
							value: '',
							scope: this,
							fn: 
								function(btn, text){
									if (btn == 'ok' && text){
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=currency',
											method: 'POST',
											params: {
												table: 'currency',
												task: 'updateValue',
												name: text
											},
                                            success:function(response,options) {
                                                var responseData = Ext.util.JSON.decode(response.responseText);
                                                my_tree.getTopToolbar().items.items[4].setText("Курс = " + responseData.name);
                                            }
                                            
										});
									}
								}
							});                                
                },
				scope: this,
         		iconCls: ''			},"-",
			{
                				text: '',
				//handler : function() { this.addEditTab(my_tree.getSelectionModel().getSelectedNode()); },
				handler : function() { tab.root.reload(); },
				scope: this,
   		      	iconCls: 'plugin'			},
            {
                				text: '',
				//handler : function() { this.addEditTab(my_tree.getSelectionModel().getSelectedNode()); },
				scope: this,
   		      	iconCls: 'plugin-add'			}]

		});

		my_tree.on('click', function(node,event) {
			this.setBottomPath(node);
		}, this);
		my_tree.on('movenode', function(tree, node, oldParent, newParent, index) {
			Ext.Ajax.request({
				scope: this,
				url: './?page=tree',
				params: {
					table: 'tree',
					task: 'saveOrder',
					node_id: node.id,
					parent_id: newParent.id,
					order: this.getParentOrder(node),
                    dir: this.getParentPath(oldParent),
                    new_dir: this.getParentPath(newParent)
				},
				callback: 
					function(options,success,response) {
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
		}, 
		this
	    );
		my_tree.on('textchange', function(node,newText,oldText) {

			if (newText == oldText) return;

			if (newText == '') {
				node.remove();
				return Ext.MessageBox.alert('Ошибка','Вы должны указать название для раздела.');
			}

			Ext.Ajax.request({
				scope: this,
				waitMsg: 'Сохранение...',
				url: './?page=tree',
				method: 'POST',
				params: {
					table: 'tree',
					task: 'update',
					key: 'id',
					keyID: node.id,
					field: 'title',
					value: newText
				},
				failure: function(response,options){
					Ext.MessageBox.alert('Ошибка','Ошибка сохранения!');
				},
				success:function(response,options) {
					
					//Ext.MessageBox.alert('',response.responseText);
					
					var responseData = Ext.util.JSON.decode(response.responseText);
					if (responseData.newID != '0') {		// если была создана новая запись
						node.id = responseData.newID;
						node.attributes.id = node.id;
						node.attributes.name = node.id;
						node.name = node.id;
                        Ext.Ajax.request({
                          scope: this,
                          url: '../core/ftp.php',
                          method: 'POST',
                          params: {
                           dir: 'img/'+node.id //node.attributes.text
                          },
                          success: 
                           function(response,options) {
                            //Ext.MessageBox.alert('Сообщение',path);
                           }
                         });
						Ext.Ajax.request({
							scope: this,
							url: './?page=tree',
							method: 'POST',
							params: {
								table: 'tree',
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

		}, 
		this
		);
		my_tree.on('render', function(node,event) {

/*
my_tree.on('render', function() {
    my_tree.dropZone = new Ext.dd.DropZone(my_tree.getView().scroller, {

//      If the mouse is over a grid row, return that node. This is

//      provided as the "target" parameter in all "onNodeXXXX" node event handling functions

        getTargetFromEvent: function(e) {
            return e.getTarget(my_tree.getView().rowSelector);
        },

//      On entry into a target node, highlight that node.

        onNodeEnter : function(target, dd, e, data){ 
            Ext.fly(target).addClass('my-row-highlight-class');
        },

//      On exit from a target node, unhighlight that node.

        onNodeOut : function(target, dd, e, data){ 
            Ext.fly(target).removeClass('my-row-highlight-class');
        },

//      While over a target node, return the default drop allowed class which

//      places a "tick" icon into the drag proxy.

        onNodeOver : function(target, dd, e, data){ 
            return Ext.dd.DropZone.prototype.dropAllowed;
        },

//      On node drop we can interrogate the target to find the underlying

//      application object that is the real target of the dragged data.

//      In this case, it is a Record in the GridPanel's Store.

//      We can use the data set up by the DragZone's getDragData method to read

//      any data we decided to attach in the DragZone's getDragData method.

        onNodeDrop : function(target, dd, e, data){
            var rowIndex = my_tree.getView().findRowIndex(target);
            var r = my_tree.getStore().getAt(rowIndex);
            Ext.Msg.alert('Drop gesture', 'Dropped Record id ' + data.draggedRecord.id +
                ' on Record id ' + r.id);
            return true;
        }
    });
};
*/

});

		my_tree.on('contextmenu', function(node,event) {

			my_tree.getSelectionModel().select(node);
			this.setBottomPath(node);
			var items = [];
			if (node.id != 0)		// не показывать пункт меню для главной страницы
            

            				items[items.length] = {
					id: 'change_url',
					text: 'Изменить URL',
					handler: 
						function() {
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
							fn: 
								function(btn, text){
									if (btn == 'ok' && text){
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=tree',
											method: 'POST',
											params: {
												table: 'tree',
												task: 'editURL',
												node_id: node.id,
												parent_id: node.parentNode.id,
												name: text
											},
											callback:
												function(options,success,response) {
													if (!success) return;
													var responseData = Ext.util.JSON.decode(response.responseText);
													if (responseData.success) {
														node.attributes.name = responseData.name;
                                                        this.setBottomPath(node);
													} 
													else 
													{
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
            				items[items.length] = {
					text: 'Переименовать',
					handler: 
						function() {
							Ext.Msg.show({
							animEl: node.getUI().getTextEl(),
							closable: false,
							modal: false,
							title: 'Ввод другого наименования',
							msg: 'Наименование раздела &laquo;'+ node.text +'&raquo;:',
							width: 300,
							prompt: true,
							buttons: Ext.MessageBox.OKCANCEL,
							value: node.attributes.text,
							scope: this,
							fn: 
								function(btn, text){
									if (btn == 'ok' && text){
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=tree',
											method: 'POST',
											params: {
												table: 'tree',
												task: 'editTitle',
												node_id: node.id,
												parent_id: node.parentNode.id,
												name: text
											},
											callback:
												function(options,success,response) {
													if (!success) return;
													var responseData = Ext.util.JSON.decode(response.responseText);
													if (responseData.success) {
														node.attributes.name = responseData.text;
														node.name = node.attributes.name;
  														this.setBottomPath(node);
													} 
													else 
													{
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
					scope: this,
         		iconCls: 'add'
				};
				if (node.id != 0) {

                					items[items.length] = {
						text: 'Создать папку для изображений',
						handler : function() { this.createDir(node); },
						scope: this,
	      			   	iconCls: 'add'
					};                
                					items[items.length] = {
						text: 'Закачать изображения в папку',
						handler : function() { this.addUpload(node); },
						scope: this,
	      			   	iconCls: 'add'
					};                
                					items[items.length] = {
						text: 'Вставить из буфера',
						handler : function() { this.addClipboard(node); },
						scope: this,
	      			   	iconCls: 'add'
					};                
                					items[items.length] = {
						text: 'Расставить статусы для категорий',
						handler : function() { 
						
			Ext.Ajax.request({
				scope: this,
				waitMsg: 'Выполнение...',
				url: './',
				method: 'POST',
				params: {
					table: 'tree',
					task: 'setStatus'
				},
				failure: function(response,options){
					Ext.MessageBox.alert('Ошибка','Ошибка!');
				},
				success:function(response,options) {
					Ext.MessageBox.alert('',response.responseText);
				}
			});


						 },
						scope: this,
	      			   	iconCls: 'add'
					};                
                					items[items.length] = {
						text: 'Расставить статусы для товаров',
						handler : function() { 
						
			Ext.Ajax.request({
				scope: this,
				waitMsg: 'Выполнение...',
				url: './',
				method: 'POST',
				params: {
					table: 'tree',
					task: 'setGoodsStatus'
				},
				failure: function(response,options){
					Ext.MessageBox.alert('Ошибка','Ошибка!');
				},
				success:function(response,options) {
					Ext.MessageBox.alert('',response.responseText);
				}
			});


						 },
						scope: this,
	      			   	iconCls: 'add'
					};                
                					items[items.length] = {
						text: 'Удалить',
						handler : function() { this.removeNode(node); },
						scope: this,
	      			   	iconCls: 'remove'
					};                
                					items[items.length] = {
						text: 'Удалить подузлы',
						handler : function() { this.removeSubNode(node); },
						scope: this,
	      			   	iconCls: 'remove'
					};
                    
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
				
					var statuses = [];
					statuses[1] = 'Неактивная ссылка (узел меню)';
					statuses[2] = 'Активная ссылка';
					statuses[3] = 'Резервный статус';
					statuses[4] = 'Выключена с подпапками';	

					var status = [];
					var i = 0;
					for (key in statuses) {
						status[status.length] = {
							text: statuses[key],
							set_status: key,
							handler: 
								function(item,checked) {
									if (checked) this.updateStatus(node, item);
								},
							scope: this,
							checked: node.attributes.status == key ? true : false,
							group: 'statusmenu'
						};
						i++; 
						if (i == statuses.length-1) break;
					}	

					items[items.length] = {
						text: 'Статус',
		   	      		iconCls: 'plugin',
						menu: {
							items : status
						}
					};
				}
        		var contextMenu = new Ext.menu.Menu({items:items}).show(node.getUI().getIconEl());
		}, this);


		this.getParentOrder = function(node) {
			var order = [];
			node.parentNode.eachChild(function(node) {
				order[order.length] = node.id;
			});
			return Ext.encode(order);
		};
		this.setBottomPath = function(node) {
			bottomText = this.getNodePath(node);
			bottomButton.setText(this.imgInfo+ ' ID: '+ node.id +', URL: '+ bottomText);
		};
		this.getNodePath = function(node, index) {
			index = index ? index : 'name';
			var path = node.getPath(index)+'/';
			return path.replace('/index/','/');
		};
		this.addEditTab = function(node) {
			if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		    var win;
            if(!win){
	            win = new Ext.Window({
	 				applyTo     : null,
	                layout      : 'fit',
	                width       : 850,
	                height      : 450,
	                closeAction :'hide',
	                //plain       : true,
	                html: '<iframe src="./?page=tree&action=edit&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            });
        	}
        	win.show();
		};
	this.addClipboard= function(node) {
    
    var content ="123";
    
	if (window.clipboardData && window.clipboardData.setData) {
		window.clipboardData.setData("Text", content);
		return true;
	}
	else {
			try { 
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
			} 
			catch (e) { 
                alert('Clipboard access not permitted, sorry. You will have to set signed.applet.codebase_principal_support to true in about:config');
				return false;
			}
	
	            const Cc = Components.classes;
	            const Ci = Components.interfaces;
	
				var clip = Cc["@mozilla.org/widget/clipboard;1"].getService(Ci.nsIClipboard);
				var trans = Cc["@mozilla.org/widget/transferable;1"].createInstance(Ci.nsITransferable);
				try {
					trans.addDataFlavor("text/unicode");
					clip.getData(trans, clip.kGlobalClipboard);
					
					var str = {}, length = {};
					trans.getTransferData(
						"text/unicode",
						str,
						length
					);
					if (length.value) {
						str = str.value.QueryInterface(Ci.nsISupportsString);
                        
	                    //alert(Base64.encode(str.data));

						Ext.Ajax.request({
							scope: this,
							url: './?page=tree',
							method: 'POST',
							params: {
										table: 'tree',
										task: 'insertRows',
										node_id: node.id,
                                        data: Base64.encode(str.data)
								},
							success: 
								function(response,options) {
									var responseData = Ext.util.JSON.decode(response.responseText);
									Ext.MessageBox.alert('Сообщение',responseData);
								}
						});
/**/

						// str = str.data;
						// if (str.length &&
						// DTA_AddingFunctions.isLinkOpenable(str)) {
						// hash = DTA_getLinkPrintHash(str);
						// address.value = str.replace(/#.*$/, '');
						// address.select();
						// }
					}
				}
				catch (ex) {
					alert("Not able to gather data from the clipboard!");
				}
	
	
	
	
	// alert(this.dump(textObj,0));
	// alert(transferable.getAnyTransferData());
	
	
	
	
				return true;
			} 
		};
this.dump = function(arr,level){
    var dumped_text = "";
    if(!level) level = 0;
    var level_padding = "";
    for(var j=0;j<level+1;j++) level_padding += "    ";
    if(typeof(arr) == 'object') {
        for(var item in arr) {
            var value = arr[item];
            if(typeof(value) == 'object') {
                dumped_text += level_padding + "'" + item + "' ...\n";
                dumped_text += dump(value,level+1);
            } else {
                dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
            }
        }
    } else {
        dumped_text = "===>"+arr+"<===("+typeof(arr)+")";
    }
    return dumped_text;
};        
		this.addUpload = function(node) {
			if (!node) return Ext.MessageBox.alert('Ошибка','Выделите раздел для закачки файлов.');
		    var win;
            if(!win){
	            win = new Ext.Window({
	 				applyTo     : null,
	                layout      : 'fit',
	                width       : 480,
	                height      : 180,
	                closeAction :'hide',
	                //plain       : true,
	                html: '<iframe src="../?mod_name=upload&path=img/'+this.getPath(my_tree.getSelectionModel().getSelectedNode())+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            });
        	}
        	win.show();
            win.on('hide', function() {
                                gallery_store.removeAll();
                                gallery_store.load({params:{dir:this.getPath(my_tree.getSelectionModel().getSelectedNode())}});
		                    } ,this);
		};
		this.getPath = function(node) {
			var path = node.id; //node.getPath();
			//path = path.replace('/1/','/');
            //if (path == "/1") path='';
			return path;
		};
		this.getParentPath = function(node) {
            var path = node.id; //node.getPath();
			path = 'img/';//+path.replace('/1/','/');
			return path;
        };
		this.createDir = function(node) {
			var path = node.id; //node.getPath();
			path = 'img/'+path;//+path.replace('/1/','/');

					Ext.Ajax.request({
						scope: this,
						url: '../core/ftp.php',
						method: 'POST',
						params: {
							dir: path //node.attributes.text
						},
						success: 
							function(response,options) {
								Ext.MessageBox.alert('Сообщение',path);
							}
					});
		};
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
						url: './?page=tree',
						method: 'POST',
						params: {
							table: 'tree',
							task: 'delete',
							key: 'id',
							rows: node.id,
							recursive: 1
						},
						success: 
							function(response,options) {
								node.remove();
							}
					});
				},
				scope: this
			});
		};
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
		this.updateTemplate = function(node,tpl,item) {
			Ext.Ajax.request({
				scope: this,
				url: './?page=tree',
				method: 'POST',
				params: {
					table: 'tree',
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

		this.updateStatus = function(node, item) {
			Ext.Ajax.request({
				scope: this,
				url: './?page=tree',
				method: 'POST',
				params: {
					table: 'tree',
					task: 'update',
					key: 'id',
					keyID: node.id,
					field: 'status',
					value: item.initialConfig.set_status
				},
				success:
					function(response,options) {
						node.attributes.status = key;
						item.setChecked(true);
					}
			});
		};
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
        this.getCurrency();

		var ge = new Ext.tree.TreeEditor(my_tree, {
			allowBlank:false,
			blankText:'Укажите название!',
			selectOnFocus:true,
			autosize: true,
			cancelOnEsc: true,
			completeOnEnter: true,
			ignoreNoChange: true
		});

		my_tree.root = new Ext.tree.AsyncTreeNode({
			text: 'Каталог товаров',
			draggable: false,
			id: this.rootID,
			name: 'index',
			tpl: 'index.tpl',
			status: 1
		});
		
		my_tree.setRootNode(my_tree.root);

		my_tree.render();
	
		my_tree.root.expand(false,false);
	
		tab = my_tree;

		var editNode = function(event) {
			grid.getStore().removeAll();
			grid.getStore().load({params:{ node: my_tree.getSelectionModel().getSelectedNode().id, start: 0, limit: 100 }});
            gallery_store.removeAll();
            gallery_store.load({params:{dir:this.getPath(my_tree.getSelectionModel().getSelectedNode())}});
		};
		
		my_tree.addListener('click', editNode, this);

        var nav = new Ext.Panel({
            title       : 'Каталог товаров',
            region      : 'west',
            split       : true,
            width       : 300,
			layout      : 'fit',
            collapsible : true,
            margins     : '0 0 0 0',
            cmargins    : '0 0 0 0',
            items		: my_tree
        }); 
        var tabs = new Ext.TabPanel({
            region    : 'center',
            margins   : '1 1 1 0', 
            activeTab : 0,
            defaults  : {
				//autoScroll : true
			},
            items: [{
                title    : 'Продукция',
                layout: 'fit',
				items     : grid//, img]
             }/*,
             {
                title    : 'Производители',
                layout: 'fit',
				items     : img
             },
             {
                title    : 'Рекомендуемый товар',
                layout: 'fit',
				items     : img
             },
             {
                title    : 'Новинки',
                layout: 'fit',
				items     : img
             },
             {
                title    : 'Лидеры продаж',
                layout: 'fit',
				items     : img
             }*/]
        });
        var central_panel = new Ext.Panel({
            region    : 'center',
			//height	  : 200,
            layout   : 'border',
            margins   : '1 1 1 0', 
			activeTab : 0,
            defaults  : {
				autoScroll : true
			},
            items     : [tabs, panel]
        });
		return {
			id: this.windowname,
			title: 'Каталог',
			width: 950,
			height: 600,
			iconCls: 'icon-grid',
			shim: false,
			animCollapse: true,
			//collapsible: true,
			maximized: true,
			constrainHeader: true,
			//layout: 'fit',
            layout: 'border',
			autoDestroy: true,
			titleCollapse: true,
			enableTabScroll:true,
			defaults: {autoScroll:true,bodyStyle:'padding:0px;'},
			items: [nav, central_panel], //this.items
       
			tools:[{
				id: 'refresh',
				hidden: false,
				handler: function(event, toolEl, p) {
					var tab = my_tree;
					switch(tab.getXType()) {
						case 'editorgrid': tab.getStore().reload(); break;
						case 'grid': tab.getStore().reload(); break;
						case 'treepanel': tab.root.reload(); break;
						default: tab.getUpdater().refresh();
					}
                    
                
				},
				scope: this
			}]
		};
	
	};

});



function dump(arr,level){
    var dumped_text = "";
    if(!level) level = 0;
    var level_padding = "";
    for(var j=0;j<level+1;j++) level_padding += "    ";
    if(typeof(arr) == 'object') {
        for(var item in arr) {
            var value = arr[item];
            if(typeof(value) == 'object') {
                dumped_text += level_padding + "'" + item + "' ...\n";
                dumped_text += dump(value,level+1);
            } else {
                dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
            }
        }
    } else {
        dumped_text = "===>"+arr+"<===("+typeof(arr)+")";
    }
    return dumped_text;
}
// new link methods
function path(data) { MyDesktop.activeModule().loadPage(data); return false; }
function newtab(data,name) { MyDesktop.activeModule().addTab(data); return false; }

// old link methods
function content(text,name) { MyDesktop.activeModule().setContent(text); return false; }
function openwindow(data) { MyDesktop.Windows[name].newWindow(data); return false; }

function aj_load(type, img, x, y){
    switch (type) {
        case "show":
            
            $('#ajax_loader')[0].style.position = 'absolute';
            $('#ajax_loader')[0].style.width = x * 2 + 'px';
            $('#ajax_loader')[0].style.height = y * 2 + 'px';
            $('#ajax_loader')[0].style.top = '50%';
            $('#ajax_loader')[0].style.left = '50%';
            var scrollTop = self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
            scrollTop = scrollTop - y;
            $('#ajax_loader')[0].style.margin = scrollTop + 'px 0 0 -' + x + 'px';
            $('#img_viewer').html('<img src="../get_image.php?file=' + img + '&width=' + (x * 2) + '&height=' + (y * 2) + '"/>');
            $('#ajax_loader')[0].style.display = 'block';
            break;
        case "hide":
            $('#ajax_loader')[0].style.display = 'none';
            break;
        default:
            break;
    }
}
/**
*
*  Base64 encode / decode
*  http://www.webtoolkit.info/
*
**/
 
var Base64 = {
 
	// private property
	_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
 
	// public method for encoding
	encode : function (input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;
 
		input = Base64._utf8_encode(input);
 
		while (i < input.length) {
 
			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);
 
			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;
 
			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}
 
			output = output +
			this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
			this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
 
		}
 
		return output;
	},
 
	// public method for decoding
	decode : function (input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;
 
		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
 
		while (i < input.length) {
 
			enc1 = this._keyStr.indexOf(input.charAt(i++));
			enc2 = this._keyStr.indexOf(input.charAt(i++));
			enc3 = this._keyStr.indexOf(input.charAt(i++));
			enc4 = this._keyStr.indexOf(input.charAt(i++));
 
			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;
 
			output = output + String.fromCharCode(chr1);
 
			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}
 
		}
 
		output = Base64._utf8_decode(output);
 
		return output;
 
	},
 
	// private method for UTF-8 encoding
	_utf8_encode : function (string) {
		string = string.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return utftext;
	},
 
	// private method for UTF-8 decoding
	_utf8_decode : function (utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
 
		while ( i < utftext.length ) {
 
			c = utftext.charCodeAt(i);
 
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			}
			else if((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i+1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			}
			else {
				c2 = utftext.charCodeAt(i+1);
				c3 = utftext.charCodeAt(i+2);
				string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
 
		}
 
		return string;
	}
 
}
Ext.grid.CheckColumn = function(config){
    Ext.apply(this, config);
    if(!this.id){
        this.id = Ext.id();
    }
    this.renderer = this.renderer.createDelegate(this);
};

Ext.grid.CheckColumn.prototype ={
    init : function(grid){
        this.grid = grid;
        this.grid.on('render', function(){
            var view = this.grid.getView();
            view.mainBody.on('mousedown', this.onMouseDown, this);
        }, this);
    },

    onMouseDown : function(e, t){
        if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
            e.stopEvent();
            var index = this.grid.getView().findRowIndex(t);
            var record = this.grid.store.getAt(index);
            
            var editEvent = {
            	grid: this.grid,
            	record: this.grid.store.getAt(index),
            	field: this.dataIndex,
            	value: this.isTrue(!record.data[this.dataIndex]),
            	originalValue: this.isTrue(record.data[this.dataIndex]),
            	row: index,
            	column: this.grid.getColumnModel().findColumnIndex(this.dataIndex)
            };
            
            record.set(this.dataIndex, editEvent.value);
            this.grid.fireEvent('afteredit',editEvent);

            //Ext.MessageBox.alert(' ',record.data[this.dataIndex]);
        }
    },
    
    isTrue : function(aVal)
    {
        //v could be 1 or 0 as number
        if (typeof(aVal)=='string') //could be "true"|"false"|"1"|"0" as string
        {
            if (isFinite(aVal))
                aVal = parseInt(aVal);
            else
                aVal = (aVal != "false") ? 1 : 0;
        }
        //Or Could be native true|false|1|0
        if (aVal==true)  aVal=1;
        if (aVal==false) aVal=0;
        
        
        return aVal;
    },

    renderer : function(v, p, record){
    
        v = this.isTrue(v);

        p.css += ' x-grid3-check-col-td'; 
        return '<div class="x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'">&#160;</div>';
    }
};