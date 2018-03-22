new function() {

	this.name = 'tree';                            // имя объекта
	this.windowname = this.name + '-win';          // имя окна
	this.id = this.name + '-win';                  // id объекта
	this.items = [];                               // массив вложенных объектов 
	this.win = null;                               // принадлежность окна
	this.activeWindow = '';
	this.launcher = false;

	this.init = function() {
		this.launcher = {
			text: 'Структура сайта',
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
		

/*** items  new ************************************************/	

~~include file="engine/tree/items/items.js"~

/**** gallery ***********************************************/		
	
~~include file="engine/tree/gallery/gallery.js"~
	
/**** my_tree ***********************************************/		
		
~~include file="engine/tree/my_tree/my_tree.js"~
	
	};

}