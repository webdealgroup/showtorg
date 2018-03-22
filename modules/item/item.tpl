

~~include file="cart/pop_up.tpl"~

                            <div class="page-title category-title">
                                <h1>~~$node.0.title~</h1>
                            </div>

                                <div class="breadcrumbs">
                                    <ul>
                                        <li class="home">
                                            <a href="http://x-light.by/" title="Go to Home Page">Главная</a>
                                            <span>&nbsp;&gt;&nbsp; </span>
                                        </li>
                                        ~~foreach name="remark" from=$remark item=i~
                                        <li class="category98">

                                            <a href="http://x-light.by/?page=~~$i.url~" >~~$i.title~</a>
                                            <span>&nbsp;&gt;&nbsp; </span>


                                        </li>
                                        ~~/foreach~
                                    </ul>
                                </div> 


~~assign var="it"  value=$items.0~



    <!--{GLOBAL_MESSAGES_3e966cafdcb3f0c9cd9f8bc6a0021644}--><!--/{GLOBAL_MESSAGES_3e966cafdcb3f0c9cd9f8bc6a0021644}-->
    <script type="text/javascript">
        ~~*var optionsPrice = new Product.OptionsPrice([]);*~
    </script>
    <div id="messages_product_view">
    </div>
    <div class="product-view">
        <div class="product-essential">
            
                <div class="no-display">
                    <input name="product" value="3462" type="hidden"><input name="related_product" id="related-products-field" value="" type="hidden">
                </div>
                
                <div class="product-img-box">
                    ~~*<p class="product-image product-image-zoom">
                        <a href="/img/~~$it.dir~/~~$it.image~" data-gal="prettyPhoto">
                       *~ 
                        
                        <table>
                            </tr>
                                <td  style="height:270px;border: 1px solid #C0C0C0;vertical-align:middle;">
                                    <a  onclick="return hs.expand(this)" href="/img/~~$it.dir~/~~$it.image~" class="highslide">
                                        <img  style="width: 261px; left: 0px; top: 65.5px;" id="image" src="/imgThumb.php?src=/img/~~$it.dir~/~~$it.image~&max_y=270" alt="~~$it.name~" title="~~$it.name~">
                                    </a>
                                </td>
                            </tr>
                        </table>
                        
                        ~~*
                        <span class="wrapper_pic_zoom"></span></a>
                    </p>*~
                    <!--p class="zoom-notice" id="track_hint">
                        Double click on above image to view full picture
                    </p>
                    <div class="zoom">
                        <img id="zoom_out" src="http://www.trustfire.com/skin/frontend/default/theme260/images/slider_btn_zoom_out.gif" alt="Zoom Out" title="Zoom Out" class="btn-zoom-out">
                        <div id="track">
                            <div style="left: 0px;" class="selected" id="handle">
                            </div>
                        </div>
                        <img id="zoom_in" src="http://www.trustfire.com/skin/frontend/default/theme260/images/slider_btn_zoom_in.gif" alt="Zoom In" title="Zoom In" class="btn-zoom-in">
                    </div-->


                </div>
                
                <div class="product-shop">
                    <div class="product-name">
                        <h1>~~$it.name~</h1>
                    </div>
                    <div class="product-name">
                        <span>~~$it.descr~</span>
                    </div>

                    <p class="availability out-of-stock">
                        Наличие: ~~if $it.qty > 0  ~<span style="color:green;font-weight:bold;">Есть</span>~~else~<span style="color:red;font-weight:bold;">Нет</span>~~/if~
                    </p>
                    <div class="price-box">
                        <span class="regular-price" id="product-price-3462"><span class="price">~~$it.cost~ руб.</span></span>
                    </div>
                    
                    ~~if $showing == 1~
                    <div class="price-box">
                        <span class="regular-price" id="product-price-3462"><span class="price" style="font-size:12px;">(~~$it.doll~ у.е.)</span></span>
                    </div>
                    ~~/if~
                    
                    ~~if $it.qty > 0  ~

                                                <button type="button" title="В наличии" class="button btn-cart">
                                                    <span><span>В наличии</span></span>
                                                </button> 
                                                
                                                <!--button type="button" title="В корзину" class="button btn-cart" onclick="javascript:show_info_fixed(~~$data[element].id~);return false;">
                                                    <span><span>В корзину</span></span>
                                                </button-->
                    ~~else~
                                                <button type="button" title="Нет в наличии" class="button btn-cart">
                                                    <span  style="background-position:0 -22px;"><span  style="background-position:100% -22px; color:#777;">Нет в наличии</span></span>
                                                </button> 
                    ~~/if~
                                                                    


                    <div class="more-views" style="padding-top:6px;">
                        <!--h2></h2-->
                        
                        ~~foreach from=$it.images item=im~
                            
                                <table style="float:left; margin-right:5px;">
                                    </tr>
                                        <td  style="height:66px;border: 1px solid #C0C0C0;vertical-align:middle;">
                                            <a  onclick="return hs.expand(this)" href="/img.php?file=/~~$im.url~" class="highslide"><img src="/imgThumb.php?src=/img/~~$im.url~&max_y=66&max_x=66"></a>
                                        </td>
                                    </tr>
                                </table>
                            
                        ~~/foreach~
                        </ul>
                    </div>
                    
                    


                </div>
                <div class="clearer">
                </div>

                    <div class="short-description" style="margin-top: 26px;">
                        <h2>Описание</h2>
                        <div class="std">
                            ~~$it.param~
                        </div>
                    </div>


        </div>

    </div>
       



~~*


~~assign var="it"  value=$items.0~

        <table class="cont_heading_table" cellpadding="0" cellspacing="0" border="0">
            <tbody>
                <tr>
                    <td class="cont_heading_td">
                        <div class="left_part">
                            <a href="index.php" class="headerNavigation">Главная</a>
                            ~~foreach from=$remark item=i~
                            » <a href="?page=~~$i.url~" class="headerNavigation">~~$i.title~</a>
	                        ~~/foreach~
                            » 
                            <br>
                            <br>
                            
                            <h1 style="color: #000000;">~~if $it.type==1~Журнал~~/if~~~if $it.type==2~Альманах~~/if~ ~~$it.name~
                            <br>
                            <div style="font-size: 11px;color: #000000;">[ <a style="font-size: 11px;color: #000000;text-transform:none;" href="http://~~$it.url~" target="_blank">~~$it.url~</a> ]</div>
                            </h1>
                            
                            
                        </div>
                        <div class="right_part" style="text-transform:none;"> 
                            <span class="productSpecialPrice"><span style="font-size: 14px;font-weight: 600;">~~$it.cost~<span lang="ru">р.</span></span><br>за 6 мес.</span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <table cellpadding="0" cellspacing="0" border="0">
            <tbody>
                <tr>
                    <td class="padd_3">
                        <div style="padding:0px 0px 9px 0px;">
                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                        </div>
                        <div class="main" style="float:left;padding:1px 1px 1px 1px;margin:0px 20px 0px 20px; text-align:center; width:134px;">
                            <table style="width:1px;" cellpadding="0" cellspacing="0" align="center" border="0">
                                <tbody>
                                    <tr>
                                        <td>
	                                		~~if $it.image != ""~<a href="/img/~~$it.dir~/~~$it.image~" title="~~$it.name~" class="highslide" onclick="return hs.expand(this)"><img border="0" src='/imgThumb.php?src=/img/~~$it.dir~/~~$it.image~&max_y=270' style="margin:10px;margin-right:20px;"/></a>~~/if~
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="main" style="margin-left: 250px;">
                            ~~$it.param~
                        
                            <br>
                            <br>
                            <span>~~if $it.pdf != '' ~<a href="~~$it.pdf~" target="_blank">PDF пробный номер</a>~~/if~</span><br /><br /><br />
                            <span class="productSpecialPrice"><span style="font-size: 14px;font-weight: 600;">~~$it.cost~<span lang="ru">р.</span></span><br>за 6 мес.</span>
                        </div>
                        <div style="clear:both;">
                        </div>
                        <div style="padding:0px 0px 9px 0px;">
                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                        </div>
                        <div class="prod_line_x padd_gg">
                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tbody>
                                <tr>
                                    <td class="padd_2">
                                        <div style="padding:0px 0px 9px 0px;">
                                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                                        </div>
                                        <table cellpadding="0" cellspacing="4" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="smallText">
                                                        Количество выходов за полугодие: ~~$it.qty~
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div style="padding:0px 0px 9px 0px;">
                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                        </div>
                        <div class="prod_line_x padd_gg">
                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tbody>
                                <tr>
                                    <td class="padd_2">
                                        <div style="padding:0px 0px 9px 0px;">
                                            <img src="images/spacer.gif" alt="" border="0" height="1" width="1">
                                        </div>
                                        <table cellpadding="2" cellspacing="0" border="0" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td class="main button_marg">
                                                        
                                                    </td>
                                                    <td class="main button_marg" align="right">
                                                        <a href="#" onclick="javascript:add_cart(~~$it.id~);return false;" title="Заказать"><img height="23" border="0" width="79" src="index_files/button_in_cart.gif" alt="Заказать" /></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
*~


