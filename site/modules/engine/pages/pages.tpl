new function() {

	this.name = 'pages';
	this.windowname = this.name + '-win';
	this.id = this.name + '-win';
	this.tabs = [];
	this.activeTabNo = 0;
	this.items = [];
	this.win = null;
	this.activeWindow = '';
	this.launcher = false;

~~include file="engine/pages/init.tpl"~

~~include file="engine/pages/createWindow.tpl"~

~~include file="engine/pages/addTab.tpl"~

~~include file="engine/pages/loadPage.tpl"~

~~include file="engine/pages/setContent.tpl"~

	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    ~~include file="engine/pages/WindowSettings/bottomButton.tpl"~

	var el = document.createElement('div');
	el.id = 'pages-div-' + this.z;
	Ext.getBody().appendChild(el);

    ~~include file="engine/pages/WindowSettings/TreePanel.tpl"~
    
    ~~include file="engine/pages/WindowSettings/click.tpl"~
    
    ~~include file="engine/pages/WindowSettings/movenode.tpl"~
    
    ~~include file="engine/pages/WindowSettings/textchange.tpl"~
    
    ~~include file="engine/pages/WindowSettings/contextmenu.tpl"~
    
    ~~include file="engine/pages/WindowSettings/getParentOrder.tpl"~
    
    ~~include file="engine/pages/WindowSettings/setBottomPath.tpl"~
    
    ~~include file="engine/pages/WindowSettings/getNodePath.tpl"~
    
    ~~include file="engine/pages/WindowSettings/addEditTab.tpl"~
    
    ~~include file="engine/pages/WindowSettings/removeNode.tpl"~
    
    ~~include file="engine/pages/WindowSettings/updateTemplate.tpl"~
    
    ~~include file="engine/pages/WindowSettings/updateStatus.tpl"~

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

    ~~include file="engine/pages/WindowSettings/return.tpl"~
    
	};

}