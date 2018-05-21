					items[items.length] = {
						text: 'Расставить статусы для товаров',
						handler : function() { 
						
			Ext.Ajax.request({
				scope: this,
				waitMsg: 'Выполнение...',
				url: './',
				method: 'POST',
				params: {
					table: 'tree',
					task: 'setGoodsStatus'
				},
				failure: function(response,options){
					Ext.MessageBox.alert('Ошибка','Ошибка!');
				},
				success:function(response,options) {
					Ext.MessageBox.alert('',response.responseText);
				}
			});


						 },
						scope: this,
	      			   	iconCls: 'add'
					};
