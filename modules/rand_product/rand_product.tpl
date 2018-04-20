                  ~~foreach from=$items item=i~

                  <div class="catalog-items__cell">
                    <div class="item-grid  js-item  js-item-grid ">
                      <div class="item-grid__inn">
                        <div class="item-grid__photo"> <a href="?mod_name=item&&id=~~$i.id~"><img alt="David Jones" class="item-grid__img js-item-main-img" src="~~$i.image~"></a>

                        </div> <a href="#" class="item-grid__name">~~$i.param~</a>
                        <div class="item-grid__category">~~$i.name~</div>
                        <!--div class="item-grid__meta">
                          <div class="item-grid__meta-left">
                            <div class="rate">
                              <div class="rate__inn">
                                <div class="rate__stars r4"> <i></i><i></i><i></i><i></i><i></i> </div>
                                <div class="rate__count">(123)</div>
                              </div>
                            </div>
                          </div>
                          <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                        </div-->
                        <div class="item-grid__actions">
                          <div class="item-grid__actions-left"> <span class="price">~~$i.cost~ р.</span> </div>
                          <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <!--a href="#" class="js-fav-add fav-btn "></a--> </div> 
                        </div>
                        <!--div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div-->
                      </div>
                    </div>
                  </div>

                ~~/foreach~



~~*include file="cart/pop_up.tpl"~

~~assign var="numCols"  value="4"~
~~assign var="data"  value=$items*~



                            <ul class="products-grid odd">
                                
                            ~~*assign var="col" value="0"~
                            ~~section name=element loop=$data~
                                ~~if $col == $numCols~
                                    </ul><ul class="products-grid odd">~~assign var="col" value="0"~
                                ~~/if~
                                    <li class="item">
                                    
                                        <a href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~"  class="product-image"><img style="display: inline;" class="lazy" src="/imgThumb.php?src=/img/~~$data[element].dir~/~~$data[element].image~&max_x=120&max_y=148" alt="~~$data[element].name~"></a>
                                        <div style="height: 31px; margin-bottom:3px;" class="product-box">
                                            <h2 class="product-name"><a  style="font-weight:bold;"href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~" >~~$data[element].name~</a></h2>
                                        </div> 
                                        <div style="height: 69px; " class="product-box">
                                            <a style="text-decoration: none;font: 13px/1 Arial,Helvetica,sans-serif;" href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~" >~~$data[element].param~</a>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
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
                                                <button type="button" title="Нет в наличии" class="button btn-cart">
                                                    <span  style="background-position:0 -22px;"><span  style="background-position:100% -22px; color:#c92a2a;">Нет в наличии</span></span>
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
                            ~~/section*~
                                                                                                                                
                                    
                            </ul>
                                
                                
                                
