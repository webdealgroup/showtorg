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
                ~~include file="engine/tree/my_tree/tree_panel/add.tpl"~
			},
			'-',
			{
                ~~include file="engine/tree/my_tree/tree_panel/folder_open.tpl"~
			},
			{
                ~~include file="engine/tree/my_tree/tree_panel/folder_close.tpl"~
			},
			{
                ~~include file="engine/tree/my_tree/tree_panel/kurs.tpl"~
			},"-",
			{
                ~~include file="engine/tree/my_tree/tree_panel/tree_reload.tpl"~
			},
            {
                ~~include file="engine/tree/my_tree/tree_panel/tree_reload_new.tpl"~
			}]

		});
