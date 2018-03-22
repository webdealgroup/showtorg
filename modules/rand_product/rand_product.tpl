~~include file="cart/pop_up.tpl"~

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
                            ~~/section~
                                                                                                                                
                                    
                            </ul>
                                
                                
                                
                                
                                
                                ~~*
                                <ul class="products-grid even">
                                    <li class="item first">
                                        <a href="http://www.trustfire.com/en/top-sellers/flashlight-tr-j12-5x-cree-xm-l-t6-4500-lumens-5-modes.html" title="Flashlight TR-J12 5x CREE XM-L T6 4500 lumens 5 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/tr-j12-perspectiva.jpg" alt="Flashlight TR-J12 5x CREE XM-L T6 4500 lumens 5 modes"></a>
                                        <div style="height: 68px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/flashlight-tr-j12-5x-cree-xm-l-t6-4500-lumens-5-modes.html" title="Flashlight TR-J12 5x CREE XM-L T6 4500 lumens 5 modes">Flashlight TR-J12 5x CREE XM-L T6 4500 lumens 5 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3467"><span class="price">$77.50</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3467/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3467/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item">
                                        <a href="http://www.trustfire.com/en/top-sellers/flashlight-t1-1x-cree-xm-l-t6-1600-lumens-5-modes.html" title="Flashlight TR-T1 1x CREE XM-L T6 1600 lumens 5 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/t1-perspectiva.jpg" alt="Flashlight TR-T1 1x CREE XM-L T6 1600 lumens 5 modes"></a>
                                        <div style="height: 68px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/flashlight-t1-1x-cree-xm-l-t6-1600-lumens-5-modes.html" title="Flashlight TR-T1 1x CREE XM-L T6 1600 lumens 5 modes">Flashlight TR-T1 1x CREE XM-L T6 1600 lumens 5 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3459"><span class="price">$36.50</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3459/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3459/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item">
                                        <a href="http://www.trustfire.com/en/top-sellers/flashlight-tr-801-1x-cree-p4-150-lumens-3-modes.html" title="Flashlight TR-801 1x CREE P4 150 lumens 3 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/trustfire-tr-801-cree-q5-wc-230-lanterna-luz-led-1-18650-_yl.jpg" alt="Flashlight TR-801 1x CREE P4 150 lumens 3 modes"></a>
                                        <div style="height: 68px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/flashlight-tr-801-1x-cree-p4-150-lumens-3-modes.html" title="Flashlight TR-801 1x CREE P4 150 lumens 3 modes">Flashlight TR-801 1x CREE P4 150 lumens 3 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3475"><span class="price">$14.90</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3475/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3475/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item last">
                                        <a href="http://www.trustfire.com/en/top-sellers/lantern-tr-j1-1x-cree-xm-l-t6-1000-lumens-4-modes-for-diving.html" title="Flashlight TR-J1 1x CREE XM-L T6 1000 lumens 4 modes for diving" class="product-image"><img style="display: inline;" class="lazy" src="index_files/tr-j1-perspectiva.jpg" alt="Flashlight TR-J1 1x CREE XM-L T6 1000 lumens 4 modes for diving"></a>
                                        <div style="height: 69px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/lantern-tr-j1-1x-cree-xm-l-t6-1000-lumens-4-modes-for-diving.html" title="Flashlight TR-J1 1x CREE XM-L T6 1000 lumens 4 modes for diving">Flashlight TR-J1 1x CREE XM-L T6 1000 lumens 4 modes for diving</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3451"><span class="price">$57.60</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3451/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3451/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="products-grid last odd">
                                    <li class="item first">
                                        <a href="http://www.trustfire.com/en/top-sellers/flashlight-x6-1x-cree-sst-90-2300-lumens-5-modes.html" title="Flashlight X6 1x CREE SST-90 2300 lumens 5 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/x6-perspectiva-650x650_1.jpg" alt="Flashlight X6 1x CREE SST-90 2300 lumens 5 modes"></a>
                                        <div style="height: 51px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/flashlight-x6-1x-cree-sst-90-2300-lumens-5-modes.html" title="Flashlight X6 1x CREE SST-90 2300 lumens 5 modes">Flashlight X6 1x CREE SST-90 2300 lumens 5 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3464"><span class="price">$147.00</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3464/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3464/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item">
                                        <a href="http://www.trustfire.com/en/top-sellers/flashlight-x8-1x-cree-xm-l-t6-1000-lumens-5-modes.html" title="Flashlight X8 1x CREE XM-L T6 1000 lumens 5 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/x8-perspectiva.jpg" alt="Flashlight X8 1x CREE XM-L T6 1000 lumens 5 modes"></a>
                                        <div style="height: 51px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/flashlight-x8-1x-cree-xm-l-t6-1000-lumens-5-modes.html" title="Flashlight X8 1x CREE XM-L T6 1000 lumens 5 modes">Flashlight X8 1x CREE XM-L T6 1000 lumens 5 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3469"><span class="price">$46.50</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3469/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3469/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item">
                                        <a href="http://www.trustfire.com/en/top-sellers/lantern-x9-1x-cree-xm-l-t6-1000-lumens-5-modes.html" title="Flashlight  X9 1x CREE XM-L T6 1000 lumens 5 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/x9-perspectiva.jpg" alt="Flashlight  X9 1x CREE XM-L T6 1000 lumens 5 modes"></a>
                                        <div style="height: 51px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/lantern-x9-1x-cree-xm-l-t6-1000-lumens-5-modes.html" title="Flashlight  X9 1x CREE XM-L T6 1000 lumens 5 modes">Flashlight  X9 1x CREE XM-L T6 1000 lumens 5 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3470"><span class="price">$51.90</span></span>
                                                </div>
                                                <button type="button" title="Add to Cart" class="button btn-cart" onclick="setLocation('http://www.trustfire.com/en/checkout/cart/add/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/product/3470/')">
                                                    <span><span>Add to Cart</span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="actions">
                                            <ul class="add-to-links">
                                                <li>
                                                    <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3470/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item last">
                                        <a href="http://www.trustfire.com/en/top-sellers/flashlight-c8-t6-1x-cree-xm-l-t6-1000-lumens-3-modes.html" title="Flashlight C8-T6 1x CREE XM-L T6 1000 lumens 3 modes" class="product-image"><img style="display: inline;" class="lazy" src="index_files/c8-t6-perspectiva.jpg" alt="Flashlight C8-T6 1x CREE XM-L T6 1000 lumens 3 modes"></a>
                                        <div style="height: 60px;" class="product-box">
                                            <h2 class="product-name"><a href="http://www.trustfire.com/en/top-sellers/flashlight-c8-t6-1x-cree-xm-l-t6-1000-lumens-3-modes.html" title="Flashlight C8-T6 1x CREE XM-L T6 1000 lumens 3 modes">Flashlight C8-T6 1x CREE XM-L T6 1000 lumens 3 modes</a></h2>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3453"><span class="price">$23.20</span></span>
                                                </div>
                                                <p class="availability out-of-stock">
                                                    <span>Out of stock</span>
                                                </p>
                                                <ul class="add-to-links">
                                                    <li>
                                                        <a href="http://www.trustfire.com/en/catalog/product_compare/add/product/3453/uenc/aHR0cDovL3d3dy50cnVzdGZpcmUuY29tL2VuL3RvcC1zZWxsZXJzLmh0bWw,/" class="link-compare">Add to Compare</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                *~
