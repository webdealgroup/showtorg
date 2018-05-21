        var central_panel = new Ext.Panel({
            region    : 'center',
			//height	  : 200,
            layout   : 'border',
            margins   : '1 1 1 0', 
			activeTab : 0,
            defaults  : {
				autoScroll : true
			},
            items     : panel //[tabs, panel]
        });
