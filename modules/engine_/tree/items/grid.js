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
                                url: "",
								param: "",
								cost: "",
								qty: "",
                                type: "",
                                hide: 1,
								young: 0
							})); //my_tree.getSelectionModel().getSelectedNode().id
							//tabl.startEditing(0, 0);
						}
						else 
						{
							Ext.MessageBox.alert('Внимание',"Не выбран узел");
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
				text:'Краткое описание',
				handler: editShortDescription,
				scope: this,
            	iconCls: 'document_edit'
			},
			'-'	,
			{
				text:'Полное описание',
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
			}],
            
       
            plugins:[checkColumn1,checkColumn2],
			store: grid_store,
            clicksToEdit: 2, 
			autoExpandColumn: 'title',
			columns: [
              {dataIndex:'node',width: 70,align :'left',header:'Раздел', editor:new Ext.form.TextField({allowBlank:false}) },
		      {header: "Наименование", dataIndex: 'name', renderer: title_img, id: 'title', sortable: true, editor:new Ext.form.TextField({allowBlank:false})},
              {dataIndex:'url',width: 170,align :'left',header:'URL', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'cost',width: 70,align :'right',header:'Цена', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'qty',width: 70,align :'right',header:'К-во выходов', editor:new Ext.form.TextField({allowBlank:false}) },
              {dataIndex:'type',width: 70,align :'right',header:'Тип', editor:new Ext.form.TextField({allowBlank:false}) },
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
