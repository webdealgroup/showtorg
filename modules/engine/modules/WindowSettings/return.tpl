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
