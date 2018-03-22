    var tpl = new Ext.XTemplate(
		'<tpl for=".">',
            '<div class="thumb-wrap" id="{name}">',
		    '<div class="thumb"><img src="../get_image.php?file=/{url}&height=70"></div>',
		    '<span class="x-noneditable">{shortName}</span></div>',
        '</tpl>',
        '<div class="x-clear"></div>'
	);
