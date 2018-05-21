				text: 'off',
				handler : function() { 

										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=currency',
											method: 'POST',
											params: {
												table: 'currency',
												task: 'updateShowing',
												name: 0
											}
                                            
										});

                               
                },
				scope: this,
   		      	iconCls: ''
