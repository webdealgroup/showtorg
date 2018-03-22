					items[items.length] = {
						text: 'Удалить подузлы',
						handler : function() { this.removeSubNode(node); },
						scope: this,
	      			   	iconCls: 'remove'
					};
