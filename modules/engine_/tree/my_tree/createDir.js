		this.createDir = function(node) {
			var path = node.id; //node.getPath();
			path = 'img/'+path;//+path.replace('/1/','/');

					Ext.Ajax.request({
						scope: this,
						url: '../core/ftp.php',
						method: 'POST',
						params: {
							dir: path //node.attributes.text
						},
						success: 
							function(response,options) {
								Ext.MessageBox.alert('Сообщение',path);
							}
					});
		};
