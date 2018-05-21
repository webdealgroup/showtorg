new function() {

	this.name = 'galleries';                            // имя объекта
	this.windowname = this.name + '-win';          // имя окна
	this.id = this.name + '-win';                  // id объекта
	this.items = [];                               // массив вложенных объектов 
	this.win = null;                               // принадлежность окна
	this.activeWindow = '';
	this.launcher = false;

	this.init = function() {
		this.launcher = {
			text: 'Фото галереи',
			iconCls: 'icon-grid',
			handler : this.createWindow,
			scope: this
		};
	};

 	this.createWindow = function(target) {
		var desktop = this.app.getDesktop();
		this.win = desktop.getWindow(this.windowname);
		if (!this.win) {
			this.win = desktop.createWindow(this.getWindowSettings());
			this.area = this.win.getComponent(this.windowname + '-panel');
		}
		this.win.show(target?target:null);
	};

	this.getWindowSettings = function() {
		

/**** gallery ***********************************************/		
	
~~include file="engine/galleries/gallery/gallery.tpl"~
	
/**** my_tree ***********************************************/		
		
~~include file="engine/galleries/my_tree/my_tree.tpl"~
	
	};

}