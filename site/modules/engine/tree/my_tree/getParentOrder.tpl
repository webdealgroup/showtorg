		this.getParentOrder = function(node) {
			var order = [];
			node.parentNode.eachChild(function(node) {
				order[order.length] = node.id;
			});
			return Ext.encode(order);
		};
