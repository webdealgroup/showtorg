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
	
~~include file="engine/tree/my_tree/tree_panel.js"~

~~include file="engine/tree/my_tree/click.js"~

~~include file="engine/tree/my_tree/movenode.js"~

~~include file="engine/tree/my_tree/textchange.js"~

~~include file="engine/tree/my_tree/render.js"~


		my_tree.on('contextmenu', function(node,event) {

			my_tree.getSelectionModel().select(node);
			this.setBottomPath(node);
			var items = [];
			if (node.id != 0)		// не показывать пункт меню для главной страницы
            

            ~~include file="engine/tree/my_tree/context_menu/change_url.js"~
            
            ~~include file="engine/tree/my_tree/context_menu/edit.js"~
            
            ~~include file="engine/tree/my_tree/context_menu/rename.js"~

				if (node.id != 0) {

                ~~include file="engine/tree/my_tree/context_menu/folder_for_images.js"~
                
                ~~include file="engine/tree/my_tree/context_menu/upload_images.js"~
                
                ~~include file="engine/tree/my_tree/context_menu/insert_from_buffer.js"~
                
                ~~include file="engine/tree/my_tree/context_menu/set_status_for_folders.js"~
                
                ~~include file="engine/tree/my_tree/context_menu/set_status_for_items.js"~
                
                ~~include file="engine/tree/my_tree/context_menu/remove.js"~
                
                ~~include file="engine/tree/my_tree/context_menu/remove_subfolders.js"~

                    
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


~~include file="engine/tree/my_tree/getParentOrder.js"~

~~include file="engine/tree/my_tree/setBottomPath.js"~

~~include file="engine/tree/my_tree/getNodePath.js"~

~~include file="engine/tree/my_tree/addEditTab.js"~

~~include file="engine/tree/my_tree/addClipboard.js"~

~~include file="engine/tree/my_tree/dump.js"~
        
~~include file="engine/tree/my_tree/addUpload.js"~

~~include file="engine/tree/my_tree/getPath.js"~

~~include file="engine/tree/my_tree/getParentPath.js"~

~~include file="engine/tree/my_tree/createDir.js"~

~~include file="engine/tree/my_tree/removeNode.js"~

~~include file="engine/tree/my_tree/removeSubNode.js"~

~~include file="engine/tree/my_tree/updateTemplate.js"~

~~include file="engine/tree/my_tree/updateStatus.js"~

~~include file="engine/tree/my_tree/getCurrency.js"~
        
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

~~include file="engine/tree/my_tree/panel_nav.js"~

~~include file="engine/tree/my_tree/panel_tabs.js"~

~~include file="engine/tree/my_tree/central_panel.js"~

~~include file="engine/tree/my_tree/return.js"~

