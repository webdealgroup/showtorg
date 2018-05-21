				items[items.length] = {
					id: 'change_url',
					text: 'Изменить URL',
					handler: 
						function() {
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
							fn: 
								function(btn, text){
									if (btn == 'ok' && text){
										Ext.Ajax.request({
											scope: this,
											waitMsg: 'Сохранение...',
											url: './?page=galleries',
											method: 'POST',
											params: {
												table: 'galleries',
												task: 'editURL',
												node_id: node.id,
												parent_id: node.parentNode.id,
												name: text
											},
											callback:
												function(options,success,response) {
													if (!success) return;
													var responseData = Ext.util.JSON.decode(response.responseText);
													if (responseData.success) {
														node.attributes.name = responseData.name;
                                                        this.setBottomPath(node);
													} 
													else 
													{
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
				};
