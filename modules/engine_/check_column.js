Ext.grid.CheckColumn = function(config){
    Ext.apply(this, config);
    if(!this.id){
        this.id = Ext.id();
    }
    this.renderer = this.renderer.createDelegate(this);
};

Ext.grid.CheckColumn.prototype ={
    init : function(grid){
        this.grid = grid;
        this.grid.on('render', function(){
            var view = this.grid.getView();
            view.mainBody.on('mousedown', this.onMouseDown, this);
        }, this);
    },

    onMouseDown : function(e, t){
        if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
            e.stopEvent();
            var index = this.grid.getView().findRowIndex(t);
            var record = this.grid.store.getAt(index);
            
            var editEvent = {
            	grid: this.grid,
            	record: this.grid.store.getAt(index),
            	field: this.dataIndex,
            	value: this.isTrue(!record.data[this.dataIndex]),
            	originalValue: this.isTrue(record.data[this.dataIndex]),
            	row: index,
            	column: this.grid.getColumnModel().findColumnIndex(this.dataIndex)
            };
            
            record.set(this.dataIndex, editEvent.value);
            this.grid.fireEvent('afteredit',editEvent);

            //Ext.MessageBox.alert(' ',record.data[this.dataIndex]);
        }
    },
    
    isTrue : function(aVal)
    {
        //v could be 1 or 0 as number
        if (typeof(aVal)=='string') //could be "true"|"false"|"1"|"0" as string
        {
            if (isFinite(aVal))
                aVal = parseInt(aVal);
            else
                aVal = (aVal != "false") ? 1 : 0;
        }
        //Or Could be native true|false|1|0
        if (aVal==true)  aVal=1;
        if (aVal==false) aVal=0;
        
        
        return aVal;
    },

    renderer : function(v, p, record){
    
        v = this.isTrue(v);

        p.css += ' x-grid3-check-col-td'; 
        return '<div class="x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'">&#160;</div>';
    }
};
