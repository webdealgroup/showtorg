	this.addEditTab = function(node) {
		if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		if (!this.tabs['editnode'+node.id]) {
			this.tabs['editnode'+node.id] = new Ext.Panel({
				html: '<iframe src="./?page=modules&action=edit&tpl='+node.attributes.tpl+'" style="width:100%; height:100%; border:0px;"></iframe>',
					frame:false,
					title: node.text,
					closable: true,
					autoDestroy: true,
					autoWidth: true,
					autoShow: true
			});
		}
		this.area.add(this.tabs['editnode'+node.id]).show();
	};
