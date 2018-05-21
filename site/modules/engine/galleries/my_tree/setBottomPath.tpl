		this.setBottomPath = function(node) {
			bottomText = this.getNodePath(node);
			bottomButton.setText(this.imgInfo+ ' ID: '+ node.id +', URL: '+ bottomText);
		};
