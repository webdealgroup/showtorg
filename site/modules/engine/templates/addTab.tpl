	this.addTab = function(data) {
		var n = data.href.replace(/[^0-9a-z]/gi, '');
		this.tabs[n] = this.area.add({
			title: data.title ? data.title : data.innerHTML,
			iconCls: 'tabs',
			autoLoad: { url: data.href, scope: this },
			closable:true
		}).show();
		this.tabs[n].on('activate', function(p) { p.getUpdater().refresh(); }, this);
	};
