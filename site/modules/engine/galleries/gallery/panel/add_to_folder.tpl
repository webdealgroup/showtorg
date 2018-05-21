				text:'Применить к разделу',
				handler: 
					function() {
                        var nodes = gallery.getSelectedRecords();
                        //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
                        
						//var selectedKeys = grid.selModel.selections.keys; 
						if (nodes.length > 0) {

                            var folder_img = "";
                            var node = my_tree.getSelectionModel().getSelectedNode();
                              
                            var nodes = gallery.getSelectedRecords();
                            
                            folder_img = nodes[0].data['name']; 
                            ////////////////////////////////////////////////////
                            
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=galleries',
											method: 'POST',
											params: {
												table: 'galleries',
												task: 'updateImage',
                                                node_id: node.id,
												name: folder_img
											},
                                            success:function(response,options) {
                                                var responseData = Ext.util.JSON.decode(response.responseText);
                                                Ext.MessageBox.alert('Сообщение','Изображение прикреплено.');
                                            }
                                            
										});                            
                            
						} 
						else 
						{
							Ext.MessageBox.alert('','Выделите изображение для прикрепления');
						}
					},
				scope: this,
            	iconCls: ''
