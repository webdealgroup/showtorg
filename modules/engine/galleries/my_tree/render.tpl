		my_tree.on('render', function(node,event) {

/*
my_tree.on('render', function() {
    my_tree.dropZone = new Ext.dd.DropZone(my_tree.getView().scroller, {

//      If the mouse is over a grid row, return that node. This is

//      provided as the "target" parameter in all "onNodeXXXX" node event handling functions

        getTargetFromEvent: function(e) {
            return e.getTarget(my_tree.getView().rowSelector);
        },

//      On entry into a target node, highlight that node.

        onNodeEnter : function(target, dd, e, data){ 
            Ext.fly(target).addClass('my-row-highlight-class');
        },

//      On exit from a target node, unhighlight that node.

        onNodeOut : function(target, dd, e, data){ 
            Ext.fly(target).removeClass('my-row-highlight-class');
        },

//      While over a target node, return the default drop allowed class which

//      places a "tick" icon into the drag proxy.

        onNodeOver : function(target, dd, e, data){ 
            return Ext.dd.DropZone.prototype.dropAllowed;
        },

//      On node drop we can interrogate the target to find the underlying

//      application object that is the real target of the dragged data.

//      In this case, it is a Record in the GridPanel's Store.

//      We can use the data set up by the DragZone's getDragData method to read

//      any data we decided to attach in the DragZone's getDragData method.

        onNodeDrop : function(target, dd, e, data){
            var rowIndex = my_tree.getView().findRowIndex(target);
            var r = my_tree.getStore().getAt(rowIndex);
            Ext.Msg.alert('Drop gesture', 'Dropped Record id ' + data.draggedRecord.id +
                ' on Record id ' + r.id);
            return true;
        }
    });
};
*/

});
