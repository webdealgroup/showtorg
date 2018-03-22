				text:'',
				handler: 
					function() {
                        var nodes = gallery.getSelectedRecords();
                        //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
                        
						var selectedKeys = grid.selModel.selections.keys; 
						if (nodes.length > 0) {
							Ext.MessageBox.confirm('','Вы точно хотите удалить выделенные изображения?', function(){
////////////////////////////////////////////////////
                            var arr = "";
                            var node = my_tree.getSelectionModel().getSelectedNode();
        			        var path = node.id; //node.getPath();
                            //    path = path.replace('/1/','/');
                            //    if (path == "/1") path='';
                            //    path = "/1/"+ path;
                                
                            var nodes = gallery.getSelectedRecords();
                            
                                for(var i = 0, len = nodes.length; i < len; i++) {
                                    var delimeter="|";
                                    if (i==0) {delimeter = ""; arr = arr + delimeter + "/" + path + "/" + nodes[0].data['name']; continue;}
                                    arr = arr + delimeter + "/" + path + "/" + nodes[i].data['name'];
                                }
								Ext.Ajax.request({
									scope: this,
									url: '../core/ftpr.php',
									params: {
										imgs: arr
									},
									failure: function(response,options){
										Ext.MessageBox.alert('Ошибка','Ошибка удаления!');
									},
									success:function(response,options) {
                                        var node = my_tree.getSelectionModel().getSelectedNode();
        			                    var path = node.id; //node.getPath();
                                        //    path = path.replace('/1/','/');   
                                        //    if (path == "/1") path='';  
                                        //    path = "/1/"+ path;
                                        gallery_store.removeAll();
                                        gallery_store.load({params:{dir:path}});
									}
								});
                                
                            }, this);
						} 
						else 
						{
							Ext.MessageBox.alert('','Выделите хотя бы одно изображение для удаления');
						}
					},
				scope: this,
            	iconCls: 'remove'
