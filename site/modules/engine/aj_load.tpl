function aj_load(type, img, x, y){
    switch (type) {
        case "show":
            
            $('#ajax_loader')[0].style.position = 'absolute';
            $('#ajax_loader')[0].style.width = x * 2 + 'px';
            $('#ajax_loader')[0].style.height = y * 2 + 'px';
            $('#ajax_loader')[0].style.top = '50%';
            $('#ajax_loader')[0].style.left = '50%';
            var scrollTop = self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
            scrollTop = scrollTop - y;
            $('#ajax_loader')[0].style.margin = scrollTop + 'px 0 0 -' + x + 'px';
            $('#img_viewer').html('<img src="'+ img +'" width="'+(x * 2)+'"  height="'+(y * 2)+'" />');
            $('#ajax_loader')[0].style.display = 'block';
            break; 
        case "hide":
            $('#ajax_loader')[0].style.display = 'none';
            break;
        default:
            break;
    }
}
