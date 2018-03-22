<?php

function initTabTree($tab,$i) {

	// Получение списка шаблонов для контекстного меню
	$templates = glob($GLOBALS['tpl_path'].'*.tpl');
	foreach ($templates as $k=>$v) {
		$templates[$k] = '"'.basename($templates[$k]).'"';
	}
	$templates = implode(', ',$templates);

	if (empty($tab['title'])) $tab['title'] = 'Структура';

?>

	this.z = <?=$i?>;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';


<?	// Нижняя кнопка с информацией 	?>
	var bottomButton = new Ext.Toolbar.Button({
		text: this.imgInfo + ' ID: '+ this.rootID +', URL: ' + bottomText,
		handler: function() { window.open(this.siteURL + bottomText); },
		scope: this
	});


<?	// Создаём слой для дерева		?>
	var el = document.createElement('div');
	el.id = 'tree-div-' + this.z;
	Ext.getBody().appendChild(el);


<?	// Собственно дерево с тулбаром		?>
	this.tabs[this.z] = new Ext.tree.TreePanel({
		title: '<?=$tab['title']?>',
		el: 'tree-div-' + this.z,
		autoScroll:true,
		animate:true,
		enableDD:true,
		containerScroll: true,
		bodyBorder: true,
		loader: new Ext.tree.TreeLoader({
		   url: '<?=$tab['url']?>',
			baseParams: { task: 'getNode' }
		}),
		dropConfig:{},
		header: false,

		bbar:[bottomButton],

		tbar:[{
			text: 'Редактировать',
			handler : function() { this.addEditTab(this.tabs[this.z].getSelectionModel().getSelectedNode()); },
			scope: this,
         iconCls: 'add'
		},{
			text: 'Добавить страницу',
			handler : function() {

				var node = this.tabs[this.z].root.appendChild(new Ext.tree.TreeNode({
					allowDrag:true
				}));
				node.parentNode.expand(false,false);
				this.tabs[this.z].getSelectionModel().select(node);
				setTimeout(function(){
					ge.editNode = node;
					ge.startEdit(node.ui.textNode, '');
				}, 10);

			},
			scope: this,
         iconCls: 'add'
		},'-',{
			text: 'Развернуть все',
			handler : function() { this.tabs[this.z].expandAll(); },
			scope: this,
         iconCls: 'folder-open'
		},{
			text: 'Свернуть все',
			handler : function() { this.tabs[this.z].collapseAll(); this.tabs[<?=$i?>].getRootNode().expand(); },
			scope: this,
         iconCls: 'folder'
		}]

	});



<?	// Обработка событий		?>


<?	// По клику на узел меняем текст на нижней кнопке
	// Здесь и далее по коду присутствует параметр node - это ссылка на объект выбранного узла		?>
	this.tabs[this.z].on('click', function(node,event) {
		this.setBottomPath(node);
	}, this);


<?	// Перемещение страницы по дереву		?>
	this.tabs[this.z].on('movenode', function(tree, node, oldParent, newParent, index) {
		Ext.Ajax.request({
			scope: this,
			url: '<?=$tab['url']?>',
			params: {
				table: '<?=$tab['table']?>',
				task: 'saveOrder',
				node_id: node.id,
				parent_id: newParent.id,
				order: this.getParentOrder(node)
			},
			callback: function(options,success,response) {
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
					this.setBottomPath(node);
				}
			}
		});
		this.setBottomPath(node);
	}, this);


<?	// Смена заголовка страницы		?>
	this.tabs[this.z].on('textchange', function(node,newText,oldText) {

		if (newText == oldText) return;

		if (newText == '') {
			node.remove();
			return Ext.MessageBox.alert('Ошибка','Вы должны указать название для раздела.');
		}

		Ext.Ajax.request({
			scope: this,
			waitMsg: 'Сохранение...',
			url: '<?=$tab['url']?>',
			method: 'POST',
			params: {
				table: '<?=$tab['table']?>',
				task: 'update',
				key: '<?=$tab['key']?>',
				keyID: node.id,
				field: 'title',
				value: newText
			},
			failure: function(response,options){
				Ext.MessageBox.alert('Ошибка','Ошибка сохранения!');
			},
			success:function(response,options) {
				var responseData = Ext.util.JSON.decode(response.responseText);
				if (responseData.newID != '0') {		// если была создана новая запись
					node.id = responseData.newID;
					node.attributes.id = node.id;
					node.attributes.name = node.id;
					node.name = node.id;
					Ext.Ajax.request({
						scope: this,
						url: '<?=$tab['url']?>',
						method: 'POST',
						params: {
							table: '<?=$tab['table']?>',
							task: 'editNode',
							node_id: node.id,
							parent_id: node.parentNode.id,
							order: this.getParentOrder(node)
						}
					});
					this.setBottomPath(node);
				}
			}
		});

	}, this);


<?	// Контекстное меню		?>
	this.tabs[this.z].on('contextmenu', function(node,event) {

		this.tabs[this.z].getSelectionModel().select(node);
		this.setBottomPath(node);

		var items = [];

		if (node.id != 0)		// не показывать пункт меню для главной страницы
		items[items.length] = {
			id: 'change_url',
			text: 'Изменить URL',
			handler: function() {

				Ext.Msg.show({
					animEl: node.getUI().getTextEl(),
					closable: false,
					modal: false,
					title: 'Ввод URL',
					msg: 'URL для раздела &laquo;'+ node.text +'&raquo;:',
					width: 300,
					prompt: true,
					buttons: Ext.MessageBox.OKCANCEL,
					value: node.attributes.name,
					scope: this,
					fn: function(btn, text){
						if (btn == 'ok' && text){
							
							Ext.Ajax.request({
								scope: this,
								waitMsg: 'Сохранение...',
								url: '<?=$tab['url']?>',
								method: 'POST',
								params: {
									table: '<?=$tab['table']?>',
									task: 'editURL',
									node_id: node.id,
									parent_id: node.parentNode.id,
									name: text
								},
								callback:function(options,success,response) {
									if (!success) return;
									var responseData = Ext.util.JSON.decode(response.responseText);
									if (responseData.success) {
										node.attributes.name = responseData.name;
										this.setBottomPath(node);
									} else {
										Ext.Msg.show({
											animEl: false,
											closable: false,
											buttons: Ext.MessageBox.OK,
											modal: false,
											title: 'Ошибка',
											msg: responseData.message ? responseData.message : 'Ошибка сохранения!',
											scope: this
										});
									}
								}
							});

						}
					}
				});
			},
			scope: this
		}

		items[items.length] = {
			text: 'Редактировать',
			handler : function() { this.addEditTab(node); },
			scope: this,
         iconCls: 'add'
		}

		if (node.id != 0) {

			items[items.length] = {
				text: 'Удалить',
				handler : function() { this.removeNode(node); },
				scope: this,
	         iconCls: 'remove'
			}


			<?	// Меню с выбором шаблона		?>
			var templ = [];
			var templates = [ <?=$templates?> ];
			for (var i=0; i < templates.length; i++) {
				templ[templ.length] = {
					text: templates[i],
					handler: function(item,checked) {
						if (checked) this.updateTemplate(node, item.initialConfig.text, item);
					},
					scope: this,
					checked: node.attributes.tpl == templates[i] ? true : false,
					group: 'tplmenu'
				}
			}

			items[items.length] = {
				text: 'Шаблон',
	         iconCls: 'plugin',
				menu: {
					items : templ
				}
			}




			<?	// Меню с выбором статуса		?>

			var statuses = [];
			statuses[1] = 'Активна';
			statuses[2] = 'Скрыта';
			statuses[3] = 'Выключена'
			statuses[4] = 'Выключена с подпапками';

			var status = [];
			var i = 0;
			for (key in statuses) {
				status[status.length] = {
					text: statuses[key],
					set_status: key,
					handler: function(item,checked) {
						if (checked) this.updateStatus(node, item);
					},
					scope: this,
					checked: node.attributes.status == key ? true : false,
					group: 'statusmenu'
				}
				i++; if (i == statuses.length-1) break;
			}

			items[items.length] = {
				text: 'Статус',
	         iconCls: 'plugin',
				menu: {
					items : status
				}
			}


		}


		<?	// Запускаем меню		?>
		var contextMenu = new Ext.menu.Menu({items:items}).show(node.getUI().getIconEl());


	}, this);


<?	// Так можно получить порядок страниц в текущем разделе		?>
	this.getParentOrder = function(node) {
		var order = [];
		node.parentNode.eachChild(function(node) {
			order[order.length] = node.id;
		});
		return Ext.encode(order);
	}


<?	// Смена текста нижней кнопки в зависимости от выбранного узла		?>
	this.setBottomPath = function(node) {
		bottomText = this.getNodePath(node);
		bottomButton.setText(this.imgInfo+ ' ID: '+ node.id +', URL: '+ bottomText);
	}


<?	// Получить путь к узлу node. Второй параметр index - атрибут, с которым будет формироваться путь		?>
	this.getNodePath = function(node, index) {
		index = index ? index : 'name';
		var path = node.getPath(index)+'/';
		return path.replace('/index/','/');
	}


<?	// Добавление таба с редактированием страницы		?>
	this.addEditTab = function(node) {
		if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		if (!this.tabs['editnode'+node.id]) {
			this.tabs['editnode'+node.id] = new Ext.Panel({
				html: '<iframe src="<?=$tab['url']?>&action=edit&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>',
					frame:false,
					title: node.text,
					closable: true,
					autoDestroy: true,
					autoWidth: true,
					autoShow: true
			});
		}
		this.area.add(this.tabs['editnode'+node.id]).show();
	}


<?	// Удаление страницы		?>
	this.removeNode = function(node) {
		Ext.Msg.show({
			animEl: node.getUI().getTextEl(),
			closable: false,
			buttons: Ext.MessageBox.OKCANCEL,
			modal: false,
			title: 'Точно?',
			msg: 'Вы уверены, что хотите удалить страницу и ВСЕ её подстраницы?',
			fn: function(btn) {
				if (btn != 'ok') return;
				Ext.Ajax.request({
					scope: this,
					url: '<?=$tab['url']?>',
					method: 'POST',
					params: {
						table: '<?=$tab['table']?>',
						task: 'delete',
						key: '<?=$tab['key']?>',
						rows: node.id,
						recursive: 1
					},
					success: function(response,options) {
						node.remove();
					}
				});
			},
			scope: this
		});
	}


<?	// Выбор шаблона для страницы через контекстное меню		?>
	this.updateTemplate = function(node,tpl,item) {
		Ext.Ajax.request({
			scope: this,
			url: '<?=$tab['url']?>',
			method: 'POST',
			params: {
				table: '<?=$tab['table']?>',
				task: 'update',
				key: '<?=$tab['key']?>',
				keyID: node.id,
				field: 'tpl',
				value: tpl
			},
			success:function(response,options) {
				node.attributes.tpl = item.initialConfig.text;
				item.setChecked(true);
			}
		});
	}


<?	// Изменение статуса страницы через контекстное меню		?>
	this.updateStatus = function(node, item) {
		Ext.Ajax.request({
			scope: this,
			url: '<?=$tab['url']?>',
			method: 'POST',
			params: {
				table: '<?=$tab['table']?>',
				task: 'update',
				key: '<?=$tab['key']?>',
				keyID: node.id,
				field: 'status',
				value: item.initialConfig.set_status
			},
			success:function(response,options) {
				node.attributes.status = key;
				item.setChecked(true);
			}
		});
	}


<?	// Инициализация редактора для названий страниц		?>
	var ge = new Ext.tree.TreeEditor(this.tabs[this.z], {
		allowBlank:false,
		blankText:'Укажите название!',
		selectOnFocus:true,
		autosize: true,
		cancelOnEsc: true,
		completeOnEnter: true,
		ignoreNoChange: true
	});


<?	// Создаём корневой узел. Забрать его с сервера не получилось :(		?>
	this.tabs[this.z].root = new Ext.tree.AsyncTreeNode({
		text: 'Главная',
		draggable: false,
		id: this.rootID,
		name: 'index',
		tpl: 'index.tpl',
		status: 1
	});
	this.tabs[this.z].setRootNode(this.tabs[this.z].root);


<?	// Нарисовали и раскрыли корневой каталог		?>
	this.tabs[this.z].render();
	this.tabs[this.z].root.expand(false,false);
	tab = this.tabs[this.z];


<?php
}

?>