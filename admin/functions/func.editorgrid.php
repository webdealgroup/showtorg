<?php

function initTabEditorGrid($tab,$i) {

	$tab['keys'] = array();
	foreach ($tab['columns'] as $col)
		$tab['keys'][] = $col['dataIndex'];
	$tab['keys'] = implode(',',$tab['keys']);

?>
		var tab = {};
		var primaryKey = '<?=$tab['key']?>';
		var tableName = '<?=$tab['table']?>';

		var editRecord = function(event) {

			var select = tab.selModel.selections.keys;
			for(var i = 0, len = select.length; i < len; i++) {

				if (!this.tabs['edit'+select[i]]) {

					this.tabs['edit'+select[i]] = this.area.add(
						new Ext.form.FormPanel({
							onSubmit: function() {
								alert('Сохранение');
							},
							submit: function() {
								this.getForm().getEl().dom.submit();
							},
							labelWidth: 70, // label settings here cascade unless overridden 
							url:'<?=$tab['url_edit']?>',
							frame:true,
							title: 'Редактирование ('+select[i]+')',
							closable: true,
							bodyStyle:'padding:5px 5px 0',
							width: '100%',
							defaults: {width: '100%'},
							defaultType: 'textfield',

							items: [
								{
									fieldLabel: 'Название',
									name: 'name',
									allowBlank:false
								},
								new Ext.form.HtmlEditor({
									fieldLabel: 'Текст',
									hiddenName:'css',
									autoWidth: true,
									style: 'width:100%;',
									height:300
								})
							],

							buttons: [{
							   text: 'Save'
							},{
							   text: 'Cancel'
							}]

						})


					).show();
                    

    
				} else {
					this.tabs['edit'+select[i]].show();
				}

			}


		}
                

		var deleteRecord = function(btn) {

			if (btn == 'yes') {

				var selectedRows = tab.selModel.selections.items;
				var selectedKeys = Ext.encode(tab.selModel.selections.keys);

				Ext.Ajax.request({
					scope: this,
					waitMsg: 'Удаление...',
					url: '<?=$tab['url_delete']?>',
					params: {
						table: tableName,
						task: "delete",
						rows: selectedKeys,
						key: primaryKey
					},
					callback: function (options, success, response) {
						if (success) { //success will be true if the request succeeded
							var json = Ext.util.JSON.decode(response.responseText);
							Ext.MessageBox.alert('OK', 'Удалено записей: ' + json.del_count);
						} else {
							Ext.MessageBox.alert('OK',response.responseText);//you won't see this alert if the next one pops up fast
							Ext.MessageBox.alert('Произошла ошибка',response.responseText);
						}
					},
					failure:function(response,options){
						Ext.MessageBox.alert('Внимание!','Произошла ошибка при выполнении запроса');
						store.rejectChanges();
					},                                      
					success:function(response,options){
						Ext.MessageBox.alert('Success','Yeah...');
						store.reload();
					}                                      
				});
			};

		};

		var updateRecord = function(gridEvent) {

			if (gridEvent.value instanceof Date) {
				var fieldValue = gridEvent.value.format('Y-m-d H:i:s');
			} else {
				var fieldValue = gridEvent.value;
			}

			Ext.Ajax.request({
				scope: this,
				waitMsg: 'Сохранение...',
				url: '<?=$tab['url_update']?>',
				method: 'POST',
				params: {
					table: tableName,
					task: "update",
					key: primaryKey,
					keyID: gridEvent.record.data[primaryKey],
					field: gridEvent.field,
					value: fieldValue,
					originalValue: gridEvent.record.modified
				},
				failure: function(response,options){
					Ext.MessageBox.alert('Warning','Oops...');
					//ds.rejectChanges();//undo any changes
				},

				success:function(response,options) {
					var responseData = Ext.util.JSON.decode(response.responseText);
					if (gridEvent.record.data[primaryKey] == null) {
						var newID = responseData.newID;
						gridEvent.record.set('newRecord','no');
						gridEvent.record.set(primaryKey,newID);
						store.commitChanges();
					} else {
						store.commitChanges();
					}
					//Ext.MessageBox.alert('Готово', responseData.message);
				}

			});

		};


		var store = new Ext.data.Store({
//			autoLoad: true,
			proxy: new Ext.data.HttpProxy({
				url: '<?=$tab['url']?>',
				method: 'POST',
				text: 'Loading...'
			}),
			baseParams: {
				table: '<?=$tab['table']?>',
				task: "getData",
				key: '<?=$tab['key']?>',
				columns: '<?=$tab['keys']?>'
			},
			reader: new Ext.data.JsonReader(),
			remoteSort: true
		});
		store.setDefaultSort('<?=$tab['defkey']?>', '<?=$tab['defdir']?>');

		var newRecord = Ext.data.Record.create(store.reader.meta);

		var cm = new Ext.grid.ColumnModel([
			new Ext.grid.CheckboxSelectionModel(),
			<?=json_objects($tab['columns'])?>
		]);
		cm.defaultSortable = true;

		var tab = new Ext.grid.EditorGridPanel({
			title: '<?=!empty($tab['title'])?$tab['title']:'...'?>',
			scope: this,
			border: false,
			store: store,
			cm: cm,
			viewConfig: { forceFit:true },
			autoExpandColumn: '<?=!empty($tab['expand'])?$tab['expand']:''?>',
			frame: false,
			clicksToEdit: 2,
			selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),
			bodyStyle: '<?=!empty($tab['bodystyle'])?$tab['bodystyle']:''?>',
			loadMask: true,

			tbar:[{
				text: 'Добавить запись',
				handler : function() {
					tab.stopEditing();
					store.add(new newRecord({ <?php

						$z = 1;
						$out = '';
						$s = sizeof($tab['columns']);
						foreach($tab['columns'] as $col):
							if ($col['dataIndex'] != $tab['key']):
								$out .= $col['dataIndex'].':""';
								if (++$z != $s) $out .= ', ';
							endif;
						endforeach;
						echo $out;

					?> }));
					tab.startEditing(0, 0);
				},
				scope: this,
            iconCls: 'add'
			}, '-', {
				text:'Удалить',
				handler: function() {
					var selectedKeys = tab.selModel.selections.keys; 
					if (selectedKeys.length > 0) {
						Ext.MessageBox.confirm('Внимание','Вы точно хотите удалить выделенные записи?', deleteRecord, this);
					} else {
						Ext.MessageBox.alert('Внимание','Выделите хотя бы одну запись для удаления');
					}
				},
				scope: this,
            iconCls: 'remove'
			}, '-', {
				text:'Редактировать',
				handler: editRecord,
				scope: this,
            iconCls: 'edit'
			}],

			bbar: new Ext.PagingToolbar({
				pageSize: <?=$tab['limit']?>,
				store: store,
				displayInfo: true,
				displayMsg: 'Показаны записи {0} - {1} из {2}',
				emptyMsg: "Записей нет",
				refreshText: 'Обновить'
			})

		});

		tab.addListener('afteredit', updateRecord, this);
		this.tabs[<?=$i?>] = tab;

		store.load({params:{ start: 0, limit: <?=$tab['limit']?> }});
		store.on('load', function(store) {
			var state = store.lastOptions.params;
			store.setDefaultSort( state.sort ? state.sort : null, state.dir ? state.dir : null );
		}, this, store );

<?php
}
?>