new function() {

	this.name = 'modules';
	this.windowname = this.name + '-win';
	this.id = this.name + '-win';
	this.tabs = [];
	this.activeTabNo = 0;
	this.items = [];
	this.win = null;
	this.activeWindow = '';
	this.launcher = false;

	this.getModsMenu = function(node)
	{
    
					var templ = [];
					var templates = [ 
                        ~~mod mod_name="list_engine_templates" action=""~
                    ];

					
					for (var i=0; i < templates.length; i++) {
						templ[templ.length] = {
							text: templates[i],
							handler:
								function(item,checked) {
									if (checked)
                                    {
                                        //this.updateTemplate(node, item.initialConfig.text, item);
                                        var node = this.tabs[this.z].root.appendChild(new Ext.tree.TreeNode({
                                            allowDrag:true
                                        }));
                                        node.parentNode.expand(false,false);
                                        this.tabs[this.z].getSelectionModel().select(node);
                                        setTimeout(function(){
                                        
                                            var ge = new Ext.tree.TreeEditor(tab, {
                                                allowBlank:false,
                                                blankText:'Укажите название!',
                                                selectOnFocus:true,
                                                autosize: true,
                                                cancelOnEsc: true,
                                                completeOnEnter: true,
                                                ignoreNoChange: true
                                            });
                                            
                                            ge.editNode = node;
                                            ge.startEdit(node.ui.textNode, '');
                                            
                                            node.attributes.tpl = item.initialConfig.text;

/*
                                            Ext.Ajax.request({
                                                scope: this,
                                                url: './?page=modules',
                                                method: 'POST',
                                                params: {
                                                    table: 'modules',
                                                    task: 'update',
                                                    key: 'id',
                                                    keyID: node.id,
                                                    field: 'tpl',
                                                    value: item.initialConfig.text
                                                },
                                                success:function(response,options) {
                                                    node.attributes.tpl = item.initialConfig.text;
                                                    //item.setChecked(true);
                                                }
                                            });
*/


                                        }, 10);
                                    
                                    }                                    
						 		},
							scope: this,
							//checked: node.attributes.tpl == templates[i] ? true : false,
							group: 'tplmenu'
						};
					}	
                    
                    return templ;
    }


~~include file=`$mods.0.folders.0.items.2`~

~~include file="engine/modules/createWindow.js"~

~~include file="engine/modules/addTab.js"~

~~include file="engine/modules/loadPage.js"~

~~include file="engine/modules/setContent.js"~

	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    ~~include file="engine/modules/WindowSettings/bottomButton.js"~

	var el = document.createElement('div');
	el.id = 'modules-div-' + this.z;
	Ext.getBody().appendChild(el);

    ~~include file="engine/modules/WindowSettings/TreePanel.js"~

    ~~include file="engine/modules/WindowSettings/click.js"~

    ~~include file="engine/modules/WindowSettings/movenode.js"~
    
    ~~include file="engine/modules/WindowSettings/textchange.js"~
    
    ~~include file="engine/modules/WindowSettings/contextmenu.js"~
    
    ~~include file="engine/modules/WindowSettings/getParentOrder.js"~
    
    ~~include file="engine/modules/WindowSettings/setBottomPath.js"~
    
    ~~include file="engine/modules/WindowSettings/getNodePath.js"~
    
    ~~include file="engine/modules/WindowSettings/addEditTab.js"~
    
    ~~include file="engine/modules/WindowSettings/removeNode.js"~
    
    ~~include file="engine/modules/WindowSettings/updateTemplate.js"~
    
    ~~include file="engine/modules/WindowSettings/updateStatus.js"~

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
		text: 'Сайт',
		draggable: false,
		id: this.rootID,
		name: 'site',
		tpl: 'site.tpl',
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

    ~~include file="engine/modules/WindowSettings/return.js"~

	};

}