Ext.BLANK_IMAGE_URL = '/god/images/s.gif'; 

MyDesktop = new Ext.app.App({
	init :function(){
		Ext.QuickTips.init();
    },

	getModules : function(){
		return [
			new MyDesktop.Windows.tree(),
			new MyDesktop.Windows.pages(),
			new MyDesktop.Windows.galleries(),
			new MyDesktop.Windows.templates(),
            new MyDesktop.Windows.modules(),
            new MyDesktop.Windows.articles()

		];
	},

	activeModule : function() {
		return this.getModule(this.desktop.getActiveWindowId()+'-win');
	},

	getStartConfig : function(){
		return {
			title: '',
			iconCls: 'user',
			toolItems: [{
				text:'Настройки',
				iconCls:'settings',
				handler: function() { this.getModule('settings-win').createWindow(); },
				scope:this
			},'-',{
				text:'Выход',
				iconCls:'logout',
				scope:this,
				handler: function() { window.location = './logout/'; }
			}]
		};
	},
	Windows : {}
});


MyDesktop.Windows.tree = Ext.extend(Ext.app.Module, ~~include file="engine/tree/tree.tpl"~);

MyDesktop.Windows.pages = Ext.extend(Ext.app.Module, ~~include file="engine/pages/pages.tpl"~);

MyDesktop.Windows.galleries = Ext.extend(Ext.app.Module, ~~include file="engine/galleries/galleries.tpl"~);

MyDesktop.Windows.templates = Ext.extend(Ext.app.Module, ~~include file="engine/templates/templates.tpl"~);

MyDesktop.Windows.modules = Ext.extend(Ext.app.Module, ~~include file="engine/modules/modules.tpl"~);

MyDesktop.Windows.articles = Ext.extend(Ext.app.Module, ~~include file="engine/articles/articles.tpl"~);



~~include file="engine/check_column.tpl"~

// new link methods
function path(data) { MyDesktop.activeModule().loadPage(data); return false; }
function newtab(data,name) { MyDesktop.activeModule().addTab(data); return false; }

// old link methods
function content(text,name) { MyDesktop.activeModule().setContent(text); return false; }
function openwindow(data) { MyDesktop.Windows[name].newWindow(data); return false; }

~~include file="engine/aj_load.tpl"~

~~include file="engine/dump.tpl"~

~~include file="engine/base64.tpl"~
