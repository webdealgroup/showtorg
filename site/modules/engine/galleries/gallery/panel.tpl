    var panel = new Ext.Panel({
        id:'images-view',
        //frame:true,
        height: 170,
        autoScroll:true,
        //autoHeight:true,
            margins     : '0 0 0 0',
            cmargins    : '0 0 0 0',        
        collapsible:true,
        collapseMode:'mini',
        //layout:'fit',
        region:'center',
        split:true,
        //region:'north',
        //title:'Фотогалерея',

        tbar:
        [
			{
                ~~include file="engine/galleries/gallery/panel/add.tpl"~
			},
			'-'	,
			{
                ~~include file="engine/galleries/gallery/panel/remove.tpl"~
			},
			'-'	,
			{
                ~~include file="engine/galleries/gallery/panel/add_to_folder.tpl"~
			},
			'-'	,
			{
                ~~include file="engine/galleries/gallery/panel/add_to_parent_folder.tpl"~
			}],

        items: gallery
    });
