        function title_img(val, x, grid_store){
        
            var node = my_tree.getSelectionModel().getSelectedNode();
            var path = node.id; //node.getPath();
            //path = path.replace('/1/', '/');
            
            //var pattern = /\r\n|\r|\n/g;
            //var new_pattern = grid_store.data.param.replace(pattern, "<br>");

            return '<a href="javascript:aj_load(\'show\',\'/' + path + '/' + grid_store.data.image + '\',\'200\',\'200\');" /><img src="../get_image.php?file=/' + path + '/' + grid_store.data.image + '&width=40&height=40" align="left"></a>' +
            '<b style="font-size: 11px;">' +val +
            '</b><br />' +
            'Описание:<font color=\'green\'>' +
            grid_store.data.param +
            '</font><br />';//+store.data.tagline;
        }
