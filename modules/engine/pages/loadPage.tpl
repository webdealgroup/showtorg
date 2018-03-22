	this.loadPage = function(data) {
		this.area.getActiveTab().load({
		    url: data.href,
//		    params: {param1: "foo", param2: "bar"}, // or a URL encoded string
//		    callback: yourFunction,
		    scope: this, // optional scope for the callback
		    discardUrl: false,
		    nocache: false,
		    text: "Loading...",
		    timeout: 30,
		    scripts: false
		});
	};
