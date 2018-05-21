				text: '',

				handler : 
					function() {
						var node = my_tree.root.appendChild(
							new Ext.tree.TreeNode({
								allowDrag:true
							})
						);

				node.parentNode.expand(false,false);
				my_tree.getSelectionModel().select(node);

				setTimeout(function(){
					ge.editNode = node;
					ge.startEdit(node.ui.textNode, '');
				}, 10);

			},
			scope: this,
         	iconCls: 'add'
                