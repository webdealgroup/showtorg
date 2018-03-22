Ext.BLANK_IMAGE_URL = '/god/images/s.gif'; 

MyDesktop = new Ext.app.App({
	init :function(){
		Ext.QuickTips.init();
    },

	getModules : function(){
		return [
        ~~foreach from=$mods.0.folders name="modules" item=i~        
			new MyDesktop.Windows.~~$i.folder~()~~if $smarty.foreach.modules.last==false~,~~/if~
        ~~/foreach~            
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


~~foreach from=$mods.0.folders item=i~        
MyDesktop.Windows.~~$i.folder~ = Ext.extend(Ext.app.Module, ~~include file="engine/`$i.folder`/`$i.folder`.js"~);

~~/foreach~


~~include file=`$mods.0.items.1`~

// new link methods
function path(data) { MyDesktop.activeModule().loadPage(data); return false; }
function newtab(data,name) { MyDesktop.activeModule().addTab(data); return false; }

// old link methods
function content(text,name) { MyDesktop.activeModule().setContent(text); return false; }
function openwindow(data) { MyDesktop.Windows[name].newWindow(data); return false; }

~~include file=`$mods.0.items.3`~

~~include file=`$mods.0.items.0`~

~~include file=`$mods.0.items.2`~
