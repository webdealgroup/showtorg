	    var gallery = new Ext.DataView({
            store: gallery_store,
            tpl: tpl,
            //autoHeight:true,
            multiSelect: true,
            overClass:'x-view-over',
            itemSelector:'div.thumb-wrap',
            emptyText: '',

            plugins: [
                new Ext.DataView.DragSelector(),
                new Ext.DataView.LabelEditor({dataIndex: 'name'})
            ],

            prepareData: function(data){
                data.shortName = Ext.util.Format.ellipsis(data.name, 15);
                data.sizeString = Ext.util.Format.fileSize(data.size);
                //data.dateString = data.lastmod.format("m/d/Y g:i a");
                return data;
            },
            
            listeners: {
            	selectionchange: {
            		fn: function(dv,nodes){
            			//var l = nodes.length;
            			//var s = l != 1 ? 's' : '';
            			//panel.setTitle('Simple DataView ('+l+' item'+s+' selected)');
						//Ext.MessageBox.alert('заголовок','текст1');
            		}
            	}
            }
        });
