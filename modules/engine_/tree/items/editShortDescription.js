		var editShortDescription = function() {
        
            var node = grid.selModel.selections.items[0].data.id;

			if (!node) return Ext.MessageBox.alert('Ошибка','Выделите товар для редактирования.');
		    var win;
            if(!win){
	            win = new Ext.Window({
	 				applyTo     : null,
	                layout      : 'fit',
	                width       : 850,
	                height      : 470,
	                closeAction :'hide',
	                //plain       : true,
	                html: '<iframe src="./?page=item&action=edit_short&id='+node+'" style="width:100%; height:100%; border:0px;"></iframe>'
	            });
        	}
        	win.show();
		};
