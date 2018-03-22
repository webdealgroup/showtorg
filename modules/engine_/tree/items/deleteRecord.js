		var deleteRecord = function(btn) {
			if (btn == 'yes') {
				var selectedRows = grid.selModel.selections.items;
				var selectedKeys = Ext.encode(grid.selModel.selections.keys);

				Ext.Ajax.request({
					scope: this,
					waitMsg: 'Удаление...',
					url: './?page=items',
					params: {
						table: "items",
						task: "delete",
						rows: selectedKeys,
						key: primaryKey
					},
					callback: function (options, success, response) {
						if (success) { //success will be true if the request succeeded
							var json = Ext.util.JSON.decode(response.responseText);
							//Ext.MessageBox.alert('OK', 'Удалено записей: ' + json.del_count);
						} else {
							Ext.MessageBox.alert('OK',response.responseText);//you won't see this alert if the next one pops up fast
							Ext.MessageBox.alert('Произошла ошибка',response.responseText);
						}
					},
					failure:function(response,options){
						Ext.MessageBox.alert('Внимание!','Произошла ошибка при выполнении запроса');
						grid_store.rejectChanges();
					},                                      
					success:function(response,options){
						//Ext.MessageBox.alert('Success','Yeah...');
						grid_store.reload();
					}                                      
				});
				
				//grid.getStore().removeAll(); 
				//grid.getStore().reload();
			};

		};
