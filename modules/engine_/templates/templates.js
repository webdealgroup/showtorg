new function() {

	this.name = 'templates';
	this.windowname = this.name + '-win';
	this.id = this.name + '-win';
	this.tabs = [];
	this.activeTabNo = 0;
	this.items = [];
	this.win = null;
	this.activeWindow = '';
	this.launcher = false;

~~include file="engine/templates/init.js"~

~~include file="engine/templates/createWindow.js"~

~~include file="engine/templates/addTab.js"~

~~include file="engine/templates/loadPage.js"~

~~include file="engine/templates/setContent.js"~

	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    ~~include file="engine/templates/WindowSettings/bottomButton.js"~

	var el = document.createElement('div');
	el.id = 'templates-div-' + this.z;
	Ext.getBody().appendChild(el);

    ~~include file="engine/templates/WindowSettings/TreePanel.js"~
    
    ~~include file="engine/templates/WindowSettings/click.js"~
    
    ~~include file="engine/templates/WindowSettings/movenode.js"~
    
    ~~include file="engine/templates/WindowSettings/textchange.js"~
    
    ~~include file="engine/templates/WindowSettings/contextmenu.js"~
    
    ~~include file="engine/templates/WindowSettings/getParentOrder.js"~
    
    ~~include file="engine/templates/WindowSettings/setBottomPath.js"~
    
    ~~include file="engine/templates/WindowSettings/getNodePath.js"~
    
    ~~include file="engine/templates/WindowSettings/addEditTab.js"~
    
    ~~include file="engine/templates/WindowSettings/removeNode.js"~
    
    ~~include file="engine/templates/WindowSettings/updateTemplate.js"~
    
    ~~include file="engine/templates/WindowSettings/updateStatus.js"~

	var ge = new Ext.tree.TreeEditor(this.tabs[this.z], {
		allowBlank:false,
		blankText:'Укажите название!',
		selectOnFocus:true,
		autosize: true,
		cancelOnEsc: true,
		completeOnEnter: true,
		ignoreNoChange: true
	});

	this.tabs[this.z].root = new Ext.tree.AsyncTreeNode({
		text: 'Главная',
		draggable: false,
		id: this.rootID,
		name: 'index',
		tpl: 'index.tpl',
		status: 1
	});
	this.tabs[this.z].setRootNode(this.tabs[this.z].root);


	this.tabs[this.z].render();
	this.tabs[this.z].root.expand(false,false);
	tab = this.tabs[this.z];

		this.items[0] = new Ext.TabPanel({
			id: this.windowname + '-panel',
			activeTab: 0,
			enableTabScroll:true,
			items: this.tabs
		});

    ~~include file="engine/templates/WindowSettings/return.js"~
    
	};

}