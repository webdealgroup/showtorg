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
