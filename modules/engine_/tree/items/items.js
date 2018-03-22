		var grid = {};
		var primaryKey = 'id';
		var tableName = 'items';
		
~~include file="engine/tree/items/editShortDescription.js"~

~~include file="engine/tree/items/editLongDescription.js"~

~~include file="engine/tree/items/deleteRecord.js"~

~~include file="engine/tree/items/updateRecord.js"~

~~include file="engine/tree/items/title_img.js"~

~~include file="engine/tree/items/grid_store.js"~


		//grid_store.load();
		var newRecord = Ext.data.Record.create(grid_store.reader.meta);	

~~include file="engine/tree/items/checkColumn1.js"~

~~include file="engine/tree/items/checkColumn2.js"~

~~include file="engine/tree/items/grid.js"~

		grid.addListener('afteredit', updateRecord, this);
		//grid.addListener('click', editRecord, this);

		grid_store.on('load', function(grid_store) {
			var state = grid_store.lastOptions.params;
			grid_store.setDefaultSort( state.sort ? state.sort : null, state.dir ? state.dir : null );
		}, this, grid_store );

~~include file="engine/tree/items/ddrow.js"~
