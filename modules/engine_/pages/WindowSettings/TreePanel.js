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
