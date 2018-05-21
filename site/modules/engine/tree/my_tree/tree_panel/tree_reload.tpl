				text: 'on',
				handler : function() { 

										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=currency',
											method: 'POST',
											params: {
												table: 'currency',
												task: 'updateShowing',
												name: 1
											}
                                            
										});

                               
                },
				scope: this,
   		      	iconCls: ''
