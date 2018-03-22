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
                ~~include file="engine/tree/my_tree/tree_panel/add.js"~
			},
			'-',
			{
                ~~include file="engine/tree/my_tree/tree_panel/folder_open.js"~
			},
			{
                ~~include file="engine/tree/my_tree/tree_panel/folder_close.js"~
			},
			{
                ~~include file="engine/tree/my_tree/tree_panel/kurs.js"~
			},"-",
			{
                ~~include file="engine/tree/my_tree/tree_panel/tree_reload.js"~
			},
            {
                ~~include file="engine/tree/my_tree/tree_panel/tree_reload_new.js"~
			}]

		});
