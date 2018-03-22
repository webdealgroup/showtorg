				text: 'Курс = ',
				handler : function() { 
                                //
                                
							Ext.Msg.show({
							//animEl: node.getUI().getTextEl(),
							closable: false,
							modal: false,
							title: 'Введите новый курс',
							msg: '',
							width: 200,
							prompt: true,
							buttons: Ext.MessageBox.OKCANCEL,
							value: '',
							scope: this,
							fn: 
								function(btn, text){
									if (btn == 'ok' && text){
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=currency',
											method: 'POST',
											params: {
												table: 'currency',
												task: 'updateValue',
												name: text
											},
                                            success:function(response,options) {
                                                var responseData = Ext.util.JSON.decode(response.responseText);
                                                my_tree.getTopToolbar().items.items[4].setText("Курс = " + responseData.name);
                                            }
                                            
										});
									}
								}
							});                                
                },
				scope: this,
         		iconCls: ''
