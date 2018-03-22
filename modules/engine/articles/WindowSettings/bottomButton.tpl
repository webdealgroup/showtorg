	var bottomButton = new Ext.Toolbar.Button({
		text: this.imgInfo + ' ID: '+ this.rootID +', URL: ' + bottomText,
		handler: function() { window.open(this.siteURL + bottomText); },
		scope: this
	});
