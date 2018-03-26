~~*debug*~
 
                ~~foreach name=vmenu  from=$menu_v item=i~
                  <li class="categories-menu__item categories-menu__item--sub">
                    <div class="categories-menu__item-inn">
                      <a href="/?page=~~$i.name~" class="categories-menu__link">~~$i.title~</a>
                    </div>
                    ~~if $i.submenu[0].title !=''~
                    <ul class="categories-menu__sub">
                      ~~foreach name=vsubmenu  from=$i.submenu item=s~
                      <li class="categories-menu__item">
                        <div class="categories-menu__item-inn">
                          <a href="/?page=~~$s.name~" class="categories-menu__link">~~$s.title~</a>
                        </div>
                      </li>
                      ~~/foreach~
                    </ul>
                    ~~/if~
                  </li>
                ~~/foreach~



                            
                            
~~*    
                                <ul id="nav">
                                    
                                    ~~foreach name=vmenu  from=$menu_v item=i~
                                    <li class="level0 nav-5 level-top parent ~~if $page_id == $i.name~ active ~~/if~">
                                        <a href="/?page=~~$i.name~" class="level-top"><span>~~$i.title~</span></a>
                                        ~~if $i.submenu[0].title !=''~
                                        <ul class="level0">
                                        
                                            ~~foreach name=vsubmenu  from=$i.submenu item=s~
                                            <li class="level1 nav-5-1 first last  ~~if $page_id == $s.id~ active ~~/if~">
                                                <a href="/?page=~~$s.name~"><span>~~$s.title~</span></a>
                                                
                                                ~~if $s.submenu[0].title !=''~
                                                <ul class="level2" style="display:block;">
                                                
                                                    ~~foreach name=vssubmenu  from=$s.submenu item=ss~
                                                    <li class="level3 nav-5-1 first last  ~~if $page_id == $ss.id~ active ~~/if~">
                                                        <a style="color:#828282 !important;" href="/?page=~~$ss.name~"><span>~~$ss.title~</span></a>
                                                    </li>
                                                    ~~/foreach~
                                                    
                                                </ul>
                                                ~~/if~
                                                
                                                
                                            </li>
                                            ~~/foreach~
                                            
                                        </ul>
                                        ~~/if~
                                    </li>  
                                    ~~/foreach~                                    

                                    
                                </ul>

        <div class="box-category">
            <ul>
                
                <!--li class="cat-header">
                    <a href="http://xtool.by/suhaya-smazka-forum/">Сухая смазка ФОРУМ</a>
                    <span></span>
                </li-->
                ~~foreach name=vmenu  from=$menu_v item=i~
                <li class="active cat-header">
                    <a class="active idCatSubcat" href="/?page=~~$i.name~">~~$i.title~</a>
                    ~~if $i.submenu[0].title !=''~
                    <span class="close"></span>
                    <ul class="active" style="display: block;">
                        ~~foreach name=vsubmenu  from=$i.submenu item=s~
                        <li class="~~if $page_id == $s.id~ active ~~/if~">
                            <a href="/?page=~~$s.name~">~~$s.title~</a>
                            <span></span>
                        </li>
                        ~~/foreach~
                    </ul>
                    ~~/if~
                </li>
                ~~/foreach~
                <!--li class="cat-header">
                    <a href="http://xtool.by/multituly/">Мультитулы</a>
                    <span></span>
                </li>
                <li class="cat-header">
                    <a href="http://xtool.by/nozhi/" class="idCatSubcat">Ножи</a>
                    <span class="close"></span>
                    <ul style="display: none;">
                        <li>
                            <a href="http://xtool.by/index.php?route=product/category&amp;path=77_113">Точилки для ножей</a>
                            <span></span>
                        </li>
                    </ul>
                </li-->

            </ul>
        </div>
                            


<style>
.box-category > ul > li span.collapsed, .box-category > ul > li.active li span.close, .box-category > ul > li.active li.active span.close.collapsed {
    background: rgba(0, 0, 0, 0) url("../images/nolines_minus.png") no-repeat scroll left top !important;
}
.box-category > ul > li span.close {
    background: rgba(0, 0, 0, 0) url("../images/nolines_minus.png") no-repeat scroll 0 0;
    display: inline-block;
    height: 21px;
    margin-left: 15px;
    margin-right: 0;
    position: absolute;
    right: 0;
    top: 6px;
    width: 21px;
}
.box-category > ul > li.active span.close {
    background: rgba(0, 0, 0, 0) url("../images/nolines_minus.png") no-repeat scroll left bottom;
}
.box-category ul, .information, .afine, .content ul, ul {
    list-style: outside none none;
    margin: 0;
    padding: 0;
}
.box-category > ul > li:first-child {
    border: 0 none;
}
.icon-tools > div, .box.category li, .featured ul li .image2 {
    position: relative;
}
.box-category > ul > li {
    background: rgba(0, 0, 0, 0) url("../images/marker-2.png") no-repeat scroll 10px 15px;
    border-top: 1px solid #e5e5e5;
    line-height: 19px;
    padding: 10px 0 10px 30px;
    position: relative;
}
.box-category > ul > li > a {
    color: #2d4845;
    display: inline-block;
    font-weight: 700;
    text-decoration: none;
    text-transform: uppercase;
    width: 85%;
}
.box-category > ul > li {
    line-height: 19px;
}
.box-category ul, .information, .afine, .content ul, ul {
    list-style: outside none none;
}
.box-category > ul > li ul {
    display: none;
    margin-bottom: -9px;
    margin-left: -20px;
    margin-top: 10px;
    padding: 0;
}

.icon-tools > div, .box.category li, .featured ul li .image2 {
    position: relative;
}
.box-category > ul > li ul > li {
    border-top: 1px solid #e5e5e5;
    line-height: 19px;
    padding: 8px 0 7px 20px;
}
.box-category > ul > li ul > li.active > a, .box-category > ul > li ul > li > a:hover {
    color: #ff7342;
}
.box-category > ul > li ul > li > a {
    background: rgba(0, 0, 0, 0) url("../images/marker-1.png") no-repeat scroll left 8px;
    color: #2d4845;
    display: inline-block;
    font-size: 12px;
    line-height: 19px;
    margin-bottom: 0;
    padding-left: 10px;
    text-decoration: none;
}
</style>

<script type="text/javascript">

$(document).ready(function() {

         $('li.cat-header ul').each(function(index) {
            $(this).prev().addClass('idCatSubcat')
         });
         
         $('li.cat-header a').after('<span></span>'); 
         $('li.cat-header ul').css('display','none');
         $('li.cat-header ul.active').css('display','block');
         $('li.cat-header ul').each(function(index) {
         
            $(this).prev().addClass('close').click(function() {
            
              if ($(this).next().css('display') == 'none') 
              {
                   $(this).next().slideDown(400, function () {
                   $(this).prev().removeClass('collapsed').addClass('expanded');
                    });
              }
              else 
              {
                    $(this).next().slideUp(400, function () {
                           $(this).prev().removeClass('expanded').addClass('collapsed');
                           $(this).find('ul').each(function() {
                                $(this).hide().prev().removeClass('expanded').addClass('collapsed');
                           });
                    });
              }
              return false;
              
           });
        });
});

</script>
*~



