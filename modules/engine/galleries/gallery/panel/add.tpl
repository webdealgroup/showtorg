				text: '',
				handler : function() {
        
		            var node = my_tree.getSelectionModel().getSelectedNode();
        			var path = node.id; 
                    path = "galleries/"+ path;
                    
					if (!node) return Ext.MessageBox.alert('Ошибка','Выделите раздел для закачки файлов.');
		    		var win;
            		if(!win){
	            		win = new Ext.Window({
	 						applyTo     : null,
	                		layout      : 'fit',
	                		width       : 480,
	                		height      : 180,
	                		closeAction :'hide',
	                		//plain       : true,
	                		html: '<iframe src="../?mod_name=upload&path=img/'+path+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            		});
        			}
        			win.show();
            		win.on('hide', function() {
                                gallery_store.removeAll();
                                gallery_store.load({params:{dir:path}});
		                    } ,this);
				},
				scope: this,
            	iconCls: 'add'
