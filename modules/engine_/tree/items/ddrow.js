		var ddrow = new Ext.dd.DropTarget(grid.getView().mainBody, {  
		    ddGroup : 'mygrid-dd',  
		    notifyDrop : function(dd, e, data){  
                var order = [];
		        var sm = grid.getSelectionModel();  
		        var rows = sm.getSelections();  
		        var cindex = dd.getDragData(e).rowIndex;  
		        if (sm.hasSelection()) {  

		            for (i = 0; i < rows.length; i++) {  
		                grid_store.remove(grid_store.getById(rows[i].id));  
		                grid_store.insert(cindex,rows[i]);  
		            }  

				var i;
		        grid_store.each(function(record)  
				  {  
				      order[i] = record.get('id');
					  i++;       
				  }, this);


                    //alert(dump(order,0));


                    Ext.Ajax.request({
						scope: this,
						url: './?page=items',
						params: {
							table: 'items',
							task: 'saveOrder',
							node: data.node,
							order: Ext.encode(order)
						},
						callback: 
							function(options,success,response) {
								var responseData = Ext.util.JSON.decode(response.responseText);
								if (responseData.success) return;
								if (responseData.message) {
									Ext.Msg.show({
										animEl: false,
										closable: false,
										buttons: Ext.MessageBox.OK,
										modal: false,
										title: 'Замечание',
										msg: responseData.message ? responseData.message : 'Ошибка сохранения!',
										scope: this
									});
									node.attributes.name = responseData.name;
									node.name = node.attributes.name;
								}
							}                    
                    });
                    
		            sm.selectRecords(rows);  
		        }    
		    }  
		});
