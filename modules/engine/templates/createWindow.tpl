	this.createWindow = function(target) {
		var desktop = this.app.getDesktop();
		this.win = desktop.getWindow(this.windowname);
		if (!this.win) {
			this.win = desktop.createWindow(this.getWindowSettings());
			this.area = this.win.getComponent(this.windowname + '-panel');
		}
		this.win.show(target?target:null);
	};
