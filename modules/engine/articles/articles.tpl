new function() {

	this.name = 'articles';
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
                                                url: './?page=articles',
                                                method: 'POST',
                                                params: {
                                                    table: 'articles',
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


~~include file="engine/articles/init.tpl"~

~~include file="engine/articles/createWindow.tpl"~

~~include file="engine/articles/addTab.tpl"~

~~include file="engine/articles/loadPage.tpl"~

~~include file="engine/articles/setContent.tpl"~

	this.getWindowSettings = function() {


	this.z = 0;
	this.siteURL = '';

	this.rootID = 1;
	this.imgInfo = '<img src="images/shared/icons/fam/info.png" align="left" hspace="5">';
	var bottomText = '/';

    ~~include file="engine/articles/WindowSettings/bottomButton.tpl"~

	var el = document.createElement('div');
	el.id = 'articles-div-' + this.z;
	Ext.getBody().appendChild(el);

    ~~include file="engine/articles/WindowSettings/TreePanel.tpl"~

    ~~include file="engine/articles/WindowSettings/click.tpl"~

    ~~include file="engine/articles/WindowSettings/movenode.tpl"~
    
    ~~include file="engine/articles/WindowSettings/textchange.tpl"~
    
    ~~include file="engine/articles/WindowSettings/contextmenu.tpl"~
    
    ~~include file="engine/articles/WindowSettings/getParentOrder.tpl"~
    
    ~~include file="engine/articles/WindowSettings/setBottomPath.tpl"~
    
    ~~include file="engine/articles/WindowSettings/getNodePath.tpl"~
    
    ~~include file="engine/articles/WindowSettings/removeNode.tpl"~
    
    ~~include file="engine/articles/WindowSettings/updateTemplate.tpl"~
    
    ~~include file="engine/articles/WindowSettings/updateStatus.tpl"~

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
		text: 'Статьи',
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

    ~~include file="engine/articles/WindowSettings/return.tpl"~

	};

}