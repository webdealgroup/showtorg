		return {
			id: this.windowname,
			title: 'Рубрикатор',
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