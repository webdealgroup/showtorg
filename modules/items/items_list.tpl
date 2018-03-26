                            ~~*debug*~

~~include file="cart/pop_up.tpl"~


                            <div class="category-products">
                                
                                ~~if $page_image !=""~
                                <div><img src="/img/~~$page_id~/~~$page_image~" /></div>
                                ~~/if~
                                                                
                                <div class="breadcrumbs">
                                    <ul>
                                        <li class="home">
                                            <a href="/" title="Go to Home Page">Главная</a>
                                            <span>&nbsp;&gt;&nbsp; </span>
                                        </li>
                                        ~~foreach name="remark" from=$remark item=i~
                                        <li class="category98">
                                            ~~if $smarty.foreach.remark.last~
                                            <strong>~~$i.title~</strong>
                                            ~~else~
                                            <a href="/?page=~~$i.url~" >~~$i.title~</a>
                                            <span>&nbsp;&gt;&nbsp; </span>
                                            ~~/if~

                                        </li>
                                        ~~/foreach~
                                    </ul>
                                </div> 

                                <div class="toolbar">
                                    <div class="pager">

	~~$page_view_block~

  
                                    </div>

                                </div>





<style>
table.page_view .sortby {
    text-align: left;
}
table.page_view td {
    height: 32px;
    vertical-align: middle;
}
table.page_view * {
    font-size: 11px;
}
table.page_view .pageview {
    text-align: right;
    width: 175px;
}
table.page_view * {
    font-size: 11px;
}
table.page_view .pageview span {
    font-weight: bold;
}
table.page_view .row_view {
    background-image: url("/index_files/rowview.gif");
}
table.page_view .row_view, table.page_view .list_view {
    background-position: 10px center;
    background-repeat: no-repeat;
    float: right;
    height: 14px;
    padding-bottom: 8px;
    padding-left: 25px;
    padding-right: 9px;
    padding-top: 8px;
    width: auto;
}
table.page_view .pageview a {
    -moz-border-bottom-colors: none;
    -moz-border-image: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFFFF;
    border-bottom-color: #E2E6E9;
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color-ltr-source: physical;
    border-left-color-rtl-source: physical;
    border-left-color-value: #E2E6E9;
    border-left-style-ltr-source: physical;
    border-left-style-rtl-source: physical;
    border-left-style-value: solid;
    border-left-width-ltr-source: physical;
    border-left-width-rtl-source: physical;
    border-left-width-value: 1px;
    border-right-color-ltr-source: physical;
    border-right-color-rtl-source: physical;
    border-right-color-value: #E2E6E9;
    border-right-style-ltr-source: physical;
    border-right-style-rtl-source: physical;
    border-right-style-value: solid;
    border-right-width-ltr-source: physical;
    border-right-width-rtl-source: physical;
    border-right-width-value: 1px;
    border-top-color: #E2E6E9;
    border-top-style: solid;
    border-top-width: 1px;
}
table.page_view .list_view {
    background-image: url("/index_files/listview.gif");
}
table.page_view .row_view, table.page_view .list_view {
    background-position: 10px center;
    background-repeat: no-repeat;
    float: right;
    height: 14px;
    padding-bottom: 8px;
    padding-left: 25px;
    padding-right: 9px;
    padding-top: 8px;
    width: auto;
}
table.page_view a {
    color: #76B013;
}
table.page_view .sortby a {
    background-position: right center;
    background-repeat: no-repeat;
    margin-bottom: 0;
    margin-left: 10px;
    margin-right: 10px;
    margin-top: 0;
    padding-bottom: 0;
    padding-left: 0;
    padding-right: 13px;
    padding-top: 0;
}
table.page_view .sortby {
    text-align: left;
}
table.page_view td {
    height: 32px;
    vertical-align: middle;
}
table.page_view * {
    font-size: 11px;
}
</style>


                  ~~foreach from=$items item=i~
                  <div class="catalog-items__cell">
                    <div class="item-grid  js-item  js-item-grid ">
                      <div class="item-grid__inn">
                        <div class="item-grid__photo">
                          <a href="#"><img alt="David Jones" class="item-grid__img js-item-main-img" src="~~$i.image~"></a>
                          <div class="item-grid__carousel carousel">
                            <div class="swiper-container js-item-gallery-carousel">
                              <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                  <div data-color="#337ab7" class="item-grid__carousel-item js-item-carousel-image"><img alt="David Jones" src="~~$i.image~">
                                  </div>
                                  
                                </div>

                              </div>
                            </div>
                          </div>
                        </div>
                        <a href="#" class="item-grid__name">~~$i.param~</a>
                        <div class="item-grid__category">
                          ~~$i.name~
                        </div>
                        <div class="item-grid__meta">
                          <div class="item-grid__meta-left">
                            <div class="rate">
                              <div class="rate__inn">
                                <div class="rate__stars r4">
                                  <i></i><i></i><i></i><i></i><i></i>
                                </div>
                                <div class="rate__count">
                                  (123)
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-grid__meta-right">
                            <a href="#" class="js-fav-add fav-btn "></a>
                          </div>
                        </div>
                        <div class="item-grid__actions">
                          <div class="item-grid__actions-left">
                            <span class="price">70 р.</span>
                          </div>
                          <div class="item-grid__actions-right">
                            <a href="#" class="js-cart-add cart-btn "></a><a href="#" class="js-fav-add fav-btn "></a>
                          </div>
                        </div>
                        <div class="item-grid__fast-view">
                          <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  ~~/foreach~





~~assign var="numCols"  value="4"~
~~assign var="data"  value=$items~




                            <ul class="products-grid odd">
                                
                            ~~assign var="col" value="0"~
                            ~~section name=element loop=$data~
                                ~~if $col == $numCols~
                                    </ul><ul class="products-grid odd">~~assign var="col" value="0"~
                                ~~/if~
                                    <li class="item">
                                    
                                        <a href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~"  class="product-image"><img style="display: inline;" class="lazy" src="/imgThumb.php?src=/img/~~$data[element].dir~/~~$data[element].image~&max_x=120&max_y=148" alt="~~$data[element].name~"></a>
                                        <div style="height: 31px; margin-bottom:3px;" class="product-box">
                                            <h2 class="product-name"><a  style="font-weight:bold;"href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~" >~~$data[element].name~</a></h2>
                                        </div> 
                                        <div style="height: 72px; " class="product-box">
                                            <a style="text-decoration: none;font: 13px/1 Arial,Helvetica,sans-serif;" href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~" >~~$data[element].param~</a>
                                        </div>
                                        <div class="extra_wrap" style="margin-top:0px;"> 
                                            <div class="price-padd-list" style="padding-top: 5px;">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3462"><span class="price">~~$data[element].cost~ руб.</span></span>
                                                </div>
                                                ~~if $showing == 1 ~
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3462"><span class="price" style="font-size:12px;">(~~$data[element].doll~ у.е.)</span></span>
                                                </div>
                                                ~~/if~
                                                ~~if $data[element].qty >0 ~

                                                <button type="button" title="В наличии" class="button btn-cart">
                                                    <span><span>В наличии</span></span>
                                                </button> 
                                                
                                                <!--button type="button" title="В корзину" class="button btn-cart" onclick="javascript:show_info_fixed(~~$data[element].id~);return false;">
                                                    <span><span>В корзину</span></span>
                                                </button-->
                                                ~~else~
                                                <button type="button" title="Нет в наличии" class="button btn-cart" >
                                                    <span  style="background-position:0 -22px;"><span  style="background-position:100% -22px; color:#777;">Нет в наличии</span></span>
                                                </button> 
                                                ~~/if~
                                            </div>
                                        </div> 
                        
                                    </li>
                                   ~~assign var="col" value="`$col+1`"~
                            ~~/section~
                            ~~assign var="remainder" value="`$numCols-$col`"~
                            ~~section name=emptyElement loop=$remainder~
                                <li class="item">&nbsp;</li>
                            ~~/section~
                                                                                                                                
                                    
                            </ul>


                                <div class="toolbar-bottom">
                                    <div class="toolbar">
                                        <div class="pager">
                                        </div>
                                        <div class="sorter">
                                        
                                            ~~$page_nav_html~
                                        
                                        </div>
                                    </div>
                                </div>
                                
                                <div>~~$page_content~</div>
                                
                            </div>


