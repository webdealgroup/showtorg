		this.createDir = function(node) {
			var path = node.id; 
			path = 'img/galleries/'+path;

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
