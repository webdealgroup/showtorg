/**** imgs ***********************************************/

var imgs_store = new Ext.data.JsonStore({
    url: 'get-images.php',
    root: 'images',
    fields: ['name', 'url', {
        name: 'size',
        type: 'float'
    }, {
        name: 'lastmod',
        type: 'date',
        dateFormat: 'timestamp'
    }]
});

//imgs_store.load({params:{dir: grid.selModel.selections.items[0].data.id }});

var imgs_tpl = new Ext.XTemplate('<tpl for=".">', '<div class="thumb-wrap" id="{name}">', '<div class="thumb"><img src="../get_image.php?file=/{url}&height=100"></div>', '<span class="x-noneditable">{shortName}</span></div>', '</tpl>', '<div class="x-clear"></div>');

var imgs = new Ext.DataView({
    store: imgs_store,
    tpl: imgs_tpl,
    //autoHeight:true,
    multiSelect: true,
    overClass: 'x-view-over',
    itemSelector: 'div.thumb-wrap',
    emptyText: '',
    
    plugins: [new Ext.DataView.DragSelector(), new Ext.DataView.LabelEditor({
        dataIndex: 'name'
    })],
    
    prepareData: function(data){
        data.shortName = Ext.util.Format.ellipsis(data.name, 15);
        data.sizeString = Ext.util.Format.fileSize(data.size);
        //data.dateString = data.lastmod.format("m/d/Y g:i a");
        return data;
    },
    
    listeners: {
        selectionchange: {
            fn: function(dv, nodes){
                //var l = nodes.length;
                //var s = l != 1 ? 's' : '';
                //panel.setTitle('Simple DataView ('+l+' item'+s+' selected)');
                //Ext.MessageBox.alert('заголовок','текст1');
            }
        }
    }
});

imgs.on('dblclick', function(dv, nodes){
    //Ext.MessageBox.alert('заголовок','текст');
    
    //imgs.stopEditing();
    //imgs.getStore().add(new newRecord({ node: "", name:""})); 
    //imgs.startEditing(0, 0);	
    
    var select = grid.selModel.selections.keys;
    var nodes = imgs.getSelectedRecords();
    
    
    //alert(this.dump(select[0],0));
    
    if (select[0] != '0') {
        Ext.Ajax.request({
            scope: this,
            waitMsg: 'Сохранение...',
            url: './index.php',
            method: 'POST',
            params: {
                table: "items",
                task: "update",
                key: "id",
                keyID: select[0],
                field: "image",
                value: nodes[0].data['name'],
                originalValue: ""//,
                //field_node: "node",
                //value_node: select[0]
            },
            failure: function(response, options){
                Ext.MessageBox.alert('Warning', 'Oops...');
                //ds.rejectChanges();//undo any changes
            },
            success: function(response, options){
                var responseData = Ext.util.JSON.decode(response.responseText);
                
                
                grid.getStore().reload();
                
                //imgs.getStore().load({
                //	params: {
                //		node: select[0],
                //		start: 0,
                //		limit: 10
                //	}
                //});       
            
                //if (gridEvent.record.data[primaryKey] == null) {
                //	var newID = responseData.newID;
                //	gridEvent.record.set('newRecord', 'no');
                //	gridEvent.record.set(primaryKey, newID);
                //	imgs_store.commitChanges();
                //}
                //else {
                //	imgs_store.commitChanges();
                //}
                //Ext.MessageBox.alert('Готово', responseData.message);
            }
            
        });
        
        
    }
    else {
        Ext.MessageBox.alert("", "Не отмечен пункт");
    }
}, this);

var imgs_panel = new Ext.Panel({
    id: 'images-view',
    //frame:true,
    height: 170,
    autoScroll: true,
    //autoHeight:true,
    margins: '0 0 0 0',
    cmargins: '0 0 0 0',
    collapsible: true,
    collapseMode: 'mini',
    layout:'fit',
    region: 'center',
    split: true,

    
    tbar: [{
        text: '',
        handler: function(){
        
            var node = my_tree.getSelectionModel().getSelectedNode();
            var path = node.id;
            path = "galleries/" + path;
            
            if (!node) 
                return Ext.MessageBox.alert('Ошибка', 'Выделите раздел для закачки файлов.');
            var win;
            if (!win) {
                win = new Ext.Window({
                    applyTo: null,
                    layout: 'fit',
                    width: 480,
                    height: 180,
                    closeAction: 'hide',
                    //plain       : true,
                    html: '<iframe src="../?mod_name=upload&path=img/' + path + '" style="width:100%; height:100%; border:0px;"></iframe>'
                });
            }
            win.show();
            win.on('hide', function(){
                imgs_store.removeAll();
                imgs_store.load({
                    params: {
                        dir: path
                    }
                });
            }, this);
        },
        scope: this,
        iconCls: 'add'
    }, '-', {
        text: '',
        handler: function(){
            var nodes = imgs.getSelectedRecords();
            //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
            
            //var selectedKeys = grid.selModel.selections.keys; 
            if (nodes.length > 0) {
                Ext.MessageBox.confirm('', 'Вы точно хотите удалить выделенные изображения?', function(){
                    ////////////////////////////////////////////////////
                    var arr = "";
                    var node = my_tree.getSelectionModel().getSelectedNode();
                    var path = node.id;
                    path = "galleries/" + path;
                    
                    var nodes = imgs.getSelectedRecords();
                    
                    for (var i = 0, len = nodes.length; i < len; i++) {
                        var delimeter = "|";
                        if (i == 0) {
                            delimeter = "";
                            arr = arr + delimeter + "/" + path + "/" + nodes[0].data['name'];
                            continue;
                        }
                        arr = arr + delimeter + "/" + path + "/" + nodes[i].data['name'];
                    }
                    Ext.Ajax.request({
                        scope: this,
                        url: '../core/ftpr.php',
                        params: {
                            imgs: arr
                        },
                        failure: function(response, options){
                            Ext.MessageBox.alert('Ошибка', 'Ошибка удаления!');
                        },
                        success: function(response, options){
                            var node = my_tree.getSelectionModel().getSelectedNode();
                            var path = node.id;
                            path = "galleries/" + path;
                            imgs_store.removeAll();
                            imgs_store.load({
                                params: {
                                    dir: path
                                }
                            });
                        }
                    });
                    
                }, this);
            }
            else {
                Ext.MessageBox.alert('', 'Выделите хотя бы одно изображение для удаления');
            }
        },
        scope: this,
        iconCls: 'remove'
    }, '-', {
        text: 'Применить к разделу',
        handler: function(){
            var nodes = imgs.getSelectedRecords();
            //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
            
            //var selectedKeys = grid.selModel.selections.keys; 
            if (nodes.length > 0) {
            
                var folder_img = "";
                var node = my_tree.getSelectionModel().getSelectedNode();
                
                var nodes = imgs.getSelectedRecords();
                
                folder_img = nodes[0].data['name'];
                ////////////////////////////////////////////////////
                
                Ext.Ajax.request({
                    scope: this,
                    waitMsg: 'Сохранение...',
                    url: './?page=galleries',
                    method: 'POST',
                    params: {
                        table: 'galleries',
                        task: 'updateImage',
                        node_id: node.id,
                        name: folder_img
                    },
                    success: function(response, options){
                        var responseData = Ext.util.JSON.decode(response.responseText);
                        Ext.MessageBox.alert('Сообщение', 'Изображение прикреплено.');
                    }
                    
                });
                
            }
            else {
                Ext.MessageBox.alert('', 'Выделите изображение для прикрепления');
            }
        },
        scope: this,
        iconCls: ''
    }, '-', {
        text: 'Применить к родительскому разделу',
        handler: function(){
            var nodes = imgs.getSelectedRecords();
            //Ext.MessageBox.alert('Внимание', nodes[0].data['name']);
            
            //var selectedKeys = grid.selModel.selections.keys; 
            if (nodes.length > 0) {
            
                var folder_img = "";
                var node = my_tree.getSelectionModel().getSelectedNode();
                
                var nodes = imgs.getSelectedRecords();
                
                folder_img = nodes[0].data['name'];
                ////////////////////////////////////////////////////
                
                Ext.Ajax.request({
                    scope: this,
                    waitMsg: 'Сохранение...',
                    url: './?page=galleries',
                    method: 'POST',
                    params: {
                        table: 'galleries',
                        task: 'updateImage',
                        node_id: node.parentNode.id,
                        name: node.id + '/' + folder_img
                    },
                    success: function(response, options){
                        var responseData = Ext.util.JSON.decode(response.responseText);
                        Ext.MessageBox.alert('Сообщение', 'Изображение прикреплено.');
                    }
                    
                });
                
            }
            else {
                Ext.MessageBox.alert('', 'Выделите изображение для прикрепления');
            }
        },
        scope: this,
        iconCls: ''
    }],
    
    items: imgs
});
/****end  imgs ***********************************************/
