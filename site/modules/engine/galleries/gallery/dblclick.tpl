		gallery.on('dblclick', function(dv,nodes) {
			//Ext.MessageBox.alert('заголовок','текст');
			
						//imgs.stopEditing();
						//imgs.getStore().add(new newRecord({ node: "", name:""})); 
						//imgs.startEditing(0, 0);	
						
			//var select = grid.selModel.selections.keys;
			var nodes = gallery.getSelectedRecords();
        
            
            //alert(this.dump(select[0],0));
			
            if (select[0] != '0')
			{
				Ext.Ajax.request({
					scope: this,
					waitMsg: 'Сохранение...',
					url: './index.php',
					method: 'POST',
					params: {
						table: "items",
						task: "update",
						key: "id",
						keyID: select[0],
						field: "image",
						value: nodes[0].data['name'],
						originalValue: ""//,
						//field_node: "node",
						//value_node: select[0]
					},
					failure: function(response, options){
						Ext.MessageBox.alert('Warning', 'Oops...');
					//ds.rejectChanges();//undo any changes
					},
					success: function(response, options){
						var responseData = Ext.util.JSON.decode(response.responseText);
                        
                        
                        grid.getStore().reload();
                        
						//imgs.getStore().load({
						//	params: {
						//		node: select[0],
						//		start: 0,
						//		limit: 10
						//	}
						//});       
                        
						//if (gridEvent.record.data[primaryKey] == null) {
						//	var newID = responseData.newID;
						//	gridEvent.record.set('newRecord', 'no');
						//	gridEvent.record.set(primaryKey, newID);
						//	imgs_store.commitChanges();
						//}
						//else {
						//	imgs_store.commitChanges();
						//}
					//Ext.MessageBox.alert('Готово', responseData.message);
					}
					
				});
				

			}
            else
            {
                Ext.MessageBox.alert("","Не отмечен товар");
            }            
		}, this);
