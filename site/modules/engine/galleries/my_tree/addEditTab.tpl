		this.addEditTab = function(node) {
			if (!node) return Ext.MessageBox.alert('Ошибка','Выделите страницу для редактирования.');
		    var win;
            if(!win){
	            win = new Ext.Window({
	 				applyTo     : null,
	                layout      : 'fit',
	                width       : 850,
	                height      : 450,
	                closeAction :'hide',
	                //plain       : true,
	                html: '<iframe src="./?page=galleries&action=edit&id='+node.id+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            });
        	}
        	win.show();
		};
