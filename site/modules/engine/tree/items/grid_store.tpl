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
				columns: 'id,node,name,param,cost,sort,hide'
			},
			reader: new Ext.data.JsonReader(),
			remoteSort: true
		});
