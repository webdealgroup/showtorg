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
	
~~include file="engine/tree/my_tree/tree_panel.tpl"~

~~include file="engine/tree/my_tree/click.tpl"~

~~include file="engine/tree/my_tree/movenode.tpl"~

~~include file="engine/tree/my_tree/textchange.tpl"~

~~include file="engine/tree/my_tree/render.tpl"~


		my_tree.on('contextmenu', function(node,event) {

			my_tree.getSelectionModel().select(node);
			this.setBottomPath(node);
			var items = [];
			if (node.id != 0)		// не показывать пункт меню для главной страницы
            

            ~~include file="engine/tree/my_tree/context_menu/change_url.tpl"~
            
            ~~include file="engine/tree/my_tree/context_menu/edit.tpl"~
            
            ~~include file="engine/tree/my_tree/context_menu/rename.tpl"~

				if (node.id != 0) {

                ~~include file="engine/tree/my_tree/context_menu/folder_for_images.tpl"~
                
                ~~include file="engine/tree/my_tree/context_menu/upload_images.tpl"~
                
                ~~include file="engine/tree/my_tree/context_menu/insert_from_buffer.tpl"~
                
                ~~include file="engine/tree/my_tree/context_menu/set_status_for_folders.tpl"~
                
                ~~include file="engine/tree/my_tree/context_menu/set_status_for_items.tpl"~
                
                ~~include file="engine/tree/my_tree/context_menu/remove.tpl"~
                
                ~~include file="engine/tree/my_tree/context_menu/remove_subfolders.tpl"~

                    
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


~~include file="engine/tree/my_tree/getParentOrder.tpl"~

~~include file="engine/tree/my_tree/setBottomPath.tpl"~

~~include file="engine/tree/my_tree/getNodePath.tpl"~

~~include file="engine/tree/my_tree/addEditTab.tpl"~

~~include file="engine/tree/my_tree/addClipboard.tpl"~

~~include file="engine/tree/my_tree/dump.tpl"~
        
~~include file="engine/tree/my_tree/addUpload.tpl"~

~~include file="engine/tree/my_tree/getPath.tpl"~

~~include file="engine/tree/my_tree/getParentPath.tpl"~

~~include file="engine/tree/my_tree/createDir.tpl"~

~~include file="engine/tree/my_tree/removeNode.tpl"~

~~include file="engine/tree/my_tree/removeSubNode.tpl"~

~~include file="engine/tree/my_tree/updateTemplate.tpl"~

~~include file="engine/tree/my_tree/updateStatus.tpl"~

~~include file="engine/tree/my_tree/getCurrency.tpl"~
        
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
			text: 'Рубрикатор',
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

~~include file="engine/tree/my_tree/panel_nav.tpl"~

~~include file="engine/tree/my_tree/panel_tabs.tpl"~

~~include file="engine/tree/my_tree/central_panel.tpl"~

~~include file="engine/tree/my_tree/return.tpl"~

