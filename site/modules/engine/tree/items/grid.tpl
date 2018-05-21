		var grid = new Ext.grid.EditorGridPanel({
			renderTo: Ext.getBody(),
			enableDragDrop : true,
			ddGroup : 'mygrid-dd',  
			ddText : 'Расположить эту строку',
			//frame:true,
			//title: '',
			//autoHeight: true, //height:100,
			//autoWidth: true, //width:100,
			header: false,
			autoScroll: true,

			tbar:[
			{
				text: '',
				handler : 
					function() { 
						/*Ext.MessageBox.alert('Внимание',my_tree.getSelectionModel().getSelectedNode().id);*/
						
						if (my_tree.getSelectionModel().getSelectedNode().id) {
							grid.stopEditing();
							grid_store.add(new newRecord({
								node: "",
								name: "",
								param: "",
								image: "",
								cost: "",
								qty: "",
                                hide: 1,
								young: 0
							})); //my_tree.getSelectionModel().getSelectedNode().id
							//tabl.startEditing(0, 0);
						}
						else 
						{
							Ext.MessageBox.alert('Внимание',"Не выбран узел в структуре сайта");
						}
					},
				scope: this,
            	iconCls: 'add'
			},
			'-'	,
			{
				text:'',
				handler: 
					function() {
						var selectedKeys = grid.selModel.selections.keys; 
						if (selectedKeys.length > 0) {
							Ext.MessageBox.confirm('Внимание','Вы точно хотите удалить выделенные записи?', deleteRecord, this);
						} 
						else 
						{
							Ext.MessageBox.alert('Внимание','Выделите хотя бы одну запись для удаления');
						}
					},
				scope: this,
            	iconCls: 'remove'
			},
			'-'	,
			{
				text:'Анонс',
				handler: editShortDescription,
				scope: this,
            	iconCls: 'document_edit'
			},
			'-'	,
			{
				text:'Текст',
				handler: editLongDescription,
				scope: this,
            	iconCls: 'document_edit'
			},
			'-'	,
			{
				text:'Обновить',
				handler: function(){
        			grid.getStore().removeAll();
        			grid.getStore().load({params:{ node: my_tree.getSelectionModel().getSelectedNode().id, start: 0, limit: 100 }});                
			        //imgs.getStore().removeAll();
			        //imgs.getStore().load({params:{ node: 0, start: 0, limit: 100 }});                    
                },
				scope: this,
            	iconCls: 'table_refresh'
			},
			'-'	,
			{
				text:'Галерея',
				handler: function() { 
				
		            var node = grid.selModel.selections.items[0].data.id;
		
					if (!node) return Ext.MessageBox.alert('Ошибка','Выделите товар для редактирования.');
				    var win;
		            if(!win){
			            win = new Ext.Window({
			 				applyTo     : null,
			                layout      : 'fit',
			                width       : 850,
			                height      : 350,
			                closeAction :'hide',
			                items: imgs_panel
			            });
                        imgs_store.load({params:{dir: 'items/'+grid.selModel.selections.items[0].data.id }});
		        	}
		        	win.show();

				 },
				 //function(){
        			//grid.getStore().removeAll();
        			//grid.getStore().load({params:{ node: my_tree.getSelectionModel().getSelectedNode().id, start: 0, limit: 100 }});                
			        //imgs.getStore().removeAll();
			        //imgs.getStore().load({params:{ node: 0, start: 0, limit: 100 }});                    
                //},
				scope: this,
            	iconCls: 'add'
			}],
            
       
            plugins:[checkColumn1,checkColumn2],
			store: grid_store,
            clicksToEdit: 2,
			autoExpandColumn: 'title',
			columns: [
              {header: "ID", width: 70, dataIndex: 'id'},
		      {header: "Кат.", dataIndex: 'node', id: 'node', sortable: true, editor:new Ext.form.TextField({allowBlank:false})},
		      {header: "Наименование", dataIndex: 'name', renderer: title_img, id: 'title', sortable: true, editor:new Ext.form.TextField({allowBlank:false})},
		      {header: "Рис.", dataIndex: 'image', id: 'image', sortable: true, editor:new Ext.form.TextField({allowBlank:false})},
              {dataIndex:'cost',width: 70,align :'right',header:'Translit', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'qty',width: 70,align :'right',header:'Номер', editor:new Ext.form.TextField({allowBlank:false}) },
              checkColumn1,
			  checkColumn2
		    ],
			sm: new Ext.grid.RowSelectionModel({  
			    singleSelect:true,  
			    listeners: {  
			        beforerowselect: function(sm,i,ke,row){  
			            grid.ddText = title_img(row.data.name, null, row);  
			        }  
			    }  
			}) 
		 });
