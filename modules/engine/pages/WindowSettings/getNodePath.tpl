	this.getNodePath = function(node, index) {
		index = index ? index : 'name';
		var path = node.getPath(index)+'/';
		return path.replace('/index/','/');
	};
