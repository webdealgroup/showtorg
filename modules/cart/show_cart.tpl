<script type="text/javascript">
function getBodyScrollTop() // координата верхнего левого угла (Y) видимой части с учетом скроллинга
{
   return self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
}

function getBodyScrollLeft()  // координата верхнего левого угла (X) видимой части с учетом скроллинга
{
   return self.pageXOffset || (document.documentElement && document.documentElement.scrollLeft) || (document.body && document.body.scrollLeft);
}

function getClientWidth() // ширина видимой части экрана
{
  return document.compatMode=='CSS1Compat' && !window.opera?document.documentElement.clientWidth:document.body.clientWidth;
}

function getClientHeight()  // высота видимой части экрана
{
  return document.compatMode=='CSS1Compat' && !window.opera?document.documentElement.clientHeight:document.body.clientHeight;
}

function show_center_block() // функция отображает блок
{
var block = document.getElementById("engineTitle");
block.style.display = "block";
block.style.top = Math.floor(getClientHeight() / 2 + getBodyScrollTop()) + "px";
block.style.left = Math.floor(getClientWidth() / 2 + getBodyScrollLeft()) + "px";
block.style.margin = "-" + Math.floor(70 / 2) + "px 0px 0px -" + Math.floor(250 / 2) + "px";
}

function unshow_center_block() // функция скрывает блок
{
var block = document.getElementById("engineTitle");
block.style.display = "none";
}

window.onscroll = window.onresize = function ()
{
var block = document.getElementById("engineTitle");
if (block.style.display == "block")
   {
      block.style.top = Math.floor(getClientHeight() / 2 + getBodyScrollTop()) + "px";
      block.style.left = Math.floor(getClientWidth() / 2 + getBodyScrollLeft()) + "px";
      block.style.margin = "-" + Math.floor(70 / 2) + "px 0px 0px -" + Math.floor(250 / 2) + "px";
   }
}
</script>

                            <style>
                           #engineTitle{
	top: 50%; /* Отступ в процентах от верхнего края окна */
	left: 50%; /* Отступ в процентах от левого края окна */
	width: 250px; /* Ширина блока */
	height: 70px; /* Высота блока */
	position: absolute; /* Абсолютное позиционирование блока */
	margin-top: -35px; /* Отрицательный отступ от верхнего края страницы, должен равняться половине высоты блока со знаком минус */
	margin-left: -125px; /* Отрицательный отступ от левого края страницы, должен равняться половине высоты блока со знаком минус */
    
    z-index: 1000;
    background: #ff0;
                            }
                            </style>                           
                            
                                <div id="engineTitle" style="display: none" align="center">
                                    <div style="font-weight:bold;font-size:15px;margin:15px;">Идет оптравка заказа,<br>подождите несколько секунд</div>
                                </div>  
                                
                                
                                

                                            <link rel="stylesheet" type="text/css" media="screen" href="/css/cmxform.css" />
                                            <script src="/js/jquery.validate.min.js" type="text/javascript"></script>
                                            <script type="text/javascript">
                                            $().ready(function(){
                                                $("#cartForm").validate({
                                                    rules: {
                                                        name: "required",
                                                        phone: "required",
                                                        email: {
                                                            required: false,
                                                            email: true
                                                        }
                                                    },
                                                    messages: {
                                                        name: "Пожалуйста, введите ваше имя",
                                                        phone: "Пожалуйста, введите номер телефона",
                                                        email: "Пожалуйста, введите корректный e-mail"
                                                    },
                                                    submitHandler: function() {
                                                    
                                                        $('#engineTitle').css('display','block');
                                                        
                                                        var pars = {
                                                            mod_name: "cart",
                                                            action: "cart_process",
                                                            ajax: 1
                                                        };
                                                        
                                                        $('#cartForm [name]:visible').each(function(){
                                                            pars['cartForm_' + $(this).attr('name')] = '' + $(this).val();
                                                        });
                                            
                                                        $.post('/index.php', pars, function(v){
                                                            if (v.cart_short_count)
                                                                $('#cart_short_count').html(v.cart_short_count);
                                                            if (v.cart_short_sum)
                                                                $('#cart_short_sum').html(v.cart_short_sum);
                                                            if (v.message) {$("#cart_content").html(v.message);window.scrollTo(0, 0);$('#engineTitle').css('display','none');}
                                                        }, 'json');
                                                    }
                                                });
                                            });
                                            
                                            function delete_good(id){
                                                var pars = {
                                                    mod_name: "cart",
                                                    action: "cart_delete_value",
                                                    ajax: 1,
                                                    id: id
                                                };
                                                $.post('/index.php', pars, function(v){
                                                    if (v.cart_short_count)
                                                        $('#cart_short_count').html(v.cart_short_count);
                                                    if (v.cart_short_sum)
                                                        $('#cart_short_sum').html(v.cart_short_sum);
                                                    if (v.message)
                                                    {
                                                        $("#cart_content").html(v.message);
                                                    }
                                                    else
                                                    {
                                                        document.getElementById("tr_" + id).parentNode.removeChild(document.getElementById("tr_" + id));
                                                        if (v.cost_total) {$("#cost_total").html(v.cost_total);}
                                                    }
                                                }, 'json');
                                            }
                                            
                                            function change_qty(id,value){
                                                var pars = {
                                                    mod_name: "cart",
                                                    action: "cart_change_value",
                                                    ajax: 1,
                                                    qty: value,
                                                    id: id
                                                };
                                                $.post('/index.php', pars, function(v){
                                                    if (v.cart_short_count)
                                                        $('#cart_short_count').html(v.cart_short_count);
                                                    if (v.cart_short_sum)
                                                        $('#cart_short_sum').html(v.cart_short_sum);
                                                    if (v.change_sum) { $("#sum_" + id).html(v.change_sum); }
                                                    if (v.cost_total) {$("#cost_total").html(v.cost_total);}
                                                }, 'json');
                                            }
                                            
                                            function change_pay(value){
                                                var pars = {
                                                    mod_name: "cart",
                                                    action: "cart_change_pay",
                                                    ajax: 1,
                                                    pay: value
                                                };
                                                $.post('/index.php', pars, function(v){
                                                    $(".pay div").removeClass("active");
                                                    $("#pay_" + value).addClass("active");
                                                    if (v.delivery)
                                                    {
                                                        $(".delivery div").removeClass("active");
                                                        $("#delivery_" + v.delivery).addClass("active");
                                                        if (value == 'invoice')
                                                        {
                                                            if ($("#delivery_home").is(":visible"))
                                                                $("#delivery_home").slideUp('fast');
                                                            $("#cartForm .cartForm_invoice").slideDown('fast');
                                                        }
                                                        else
                                                        {
                                                            if ($("#delivery_home").is(":hidden"))
                                                                $("#delivery_home").slideDown('fast');
                                                            $("#cartForm .cartForm_invoice").slideUp('fast');
                                                        }
                                                    }
                                                    if (v.cost_total) {$("#cost_total").html(v.cost_total);}
                                                }, 'json');
                                            }
                                            
                                            function change_delivery(value){
                                                var pars = {
                                                    mod_name: "cart",
                                                    action: "cart_change_delivery",
                                                    ajax: 1,
                                                    pay: value
                                                };
                                                $.post('/index.php', pars, function(v){
                                                    $(".delivery div").removeClass("active");
                                                    $("#delivery_" + value).addClass("active");
                                                    if (v.cost_total) {$("#cost_total").html(v.cost_total);}
                                                }, 'json');
                                            }
                                            
                                            </script>
                                            
                                            
                                            <style>
                                                table.tableCart td.td_1 { }
                                                table.tableCart td.td_2 { width: 100px; text-align: center; }
                                                table.tableCart td.td_3 { width: 75px; text-align: center; }
                                                table.tableCart td.td_4 { width: 100px; text-align: center; }
                                                table.tableCart td.td_5 { width: 24px; text-align: center; }
                                                table.tableCart tr td { border-bottom: 1px solid #ccc; vertical-align: middle; padding: 5px 0; }
                                                table.tableCart td.th { color: #777; font-size: 11px; }
                                                .cost_total { font-size: 11px; font-weight: bold; background-color: #fff; padding: 15px 0 15px 5px; }
                                                .cost_total span { color: #C83B00; font-size: 16px; }
                                                .menu_radio { padding: 10px 0; border-bottom: 1px solid #ccc; }
                                                .menu_radio div { padding: 5px 21px; background: none no-repeat left center; cursor: pointer; }
                                                .menu_radio div:hover { color: #76B013; }
                                                .menu_radio div.active { font-weight: bold; background-image: url('/index_files/check.gif'); }
                                                #delivery_home { ~~if $pay == 'invoice'~display: none;~~/if~ }
                                            </style>
                                            
        <style>
        input.quantity-plus {
            background: rgba(0, 0, 0, 0) url("../img/quantity-controls.png") repeat-x scroll 0 0;
            margin-bottom: 2px;
        }
        input.quantity-minus {
            background: rgba(0, 0, 0, 0) url("../img/quantity-controls.png") repeat-x scroll 15px 0;
            margin-bottom: 2px;
        }
        input.quantity-controls {
            border: medium none;
            height: 14px;
            width: 15px;
        }
        </style>
                                            
                                            <div class = "content">
                                                <h1 style="color: #000;">
                                                    Расчет заказа
                                                </h1>
                                            
                                                <table cellspacing="0" cellpadding="0" border="0" align="center" class="prod2_t prod_table">
                                                  <tbody><tr>
                                                    <td align="center" class="prod2_r"><table cellspacing="0" cellpadding="0" border="0" class="prod2_b">
                                                        <tbody><tr>
                                                          <td class="prod2_l"><table cellspacing="0" cellpadding="0" border="0" class="prod2_tl">
                                                              <tbody><tr>
                                                                <td class="prod2_tr"><table cellspacing="0" cellpadding="0" border="0" class="prod2_bl" style="width: 715px;">
                                                                    <tbody>
                                                                    <tr>
                                                                      <td class="prod2_br prod2_td">
                                            
                                                                      <div id="cart_content">
                                            
                                                        ~~if $items~
                                                                        <div class="m_bg" style="margin: 12px 0px;">
                                                                            <div class="m_tl">
                                                                                <div class="m_tr">
                                                                                    <div class="m_bl">
                                                                                        <div class="m_br">
                                                                                            <div class="width_100"> 
                                            
                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="tableCart">
                                                            <tbody>
                                                                <tr>
                                                                    <td class=" th"> </td>
                                                                    <td class="td_1 th">Наименование </td>
                                                                    <td class="td_2 th">Цена, бел.руб. с НДС</td>
                                                                    <td class="td_3 th">Количество</td>
                                                                    <td class="td_4 th">Сумма, бел.руб. с НДС</td>
                                                                    <td class="td_5 th">&nbsp;</td>
                                                                </tr>
                                            
                                                                ~~foreach from=$items item=i~
                                            
                                                                <tr id="tr_~~$i.id~">
                                                                    <td class="td_1" style="width:65px;">
                                                                        <img style="display: inline;" class="lazy" src="/imgThumb.php?src=/img/~~$i.path~/~~$i.image~&max_x=60&max_y=74" alt="~~$i.name~">
                                                                    </td>
                                                                    <td class="td_1">
                                                                        <input type="hidden" name="message[]" value="~~$i.id~" />
                                                                        <a href="/?mod_name=item&id=~~$i.id~" target="-blank">~~$i.name~</a><br />
                                                                    </td>
                                                                    <td class="td_2">
                                                                        <span name="cost_~~$i.id~" id="cost_~~$i.id~" class="productSpecialPrice2">~~$i.cost~</span>
                                                                    </td>
                                                                    <td class="td_3">
                                                                        <input class="quantity-controls quantity-minus" type="button" onclick="if ($('#qty_~~$i.id~').val()>1) {$('#qty_~~$i.id~').val( $('#qty_~~$i.id~').val()-1 );change_qty('~~$i.id~', $('#qty_~~$i.id~').val());} ">
                                                                        <input type="text" name="qty_~~$i.id~" size="2" id="qty_~~$i.id~" onchange="javascript:change_qty('~~$i.id~', this.value);" value="~~$i.qty~" class="input-text" style="width: 20px;text-align:center; font-size:14px;" />
                                                                        <input class="quantity-controls quantity-plus" type="button" onclick="$('#qty_~~$i.id~').val( Number($('#qty_~~$i.id~').val())+1 );change_qty('~~$i.id~', $('#qty_~~$i.id~').val()); ">
                                                                    </td>
                                                                    <td class="td_4">
                                                                        <span name="sum_~~$i.id~" id="sum_~~$i.id~" class="productSpecialPrice2"><b>~~$i.sum~</b></span>
                                                                    </td>
                                                                    <td class="td_5">
                                                                        <a href="#" onclick="javascript:delete_good('~~$i.id~');return false;" class="buttonMedium fR" title="Удалить из корзины"><img src="images/shared/icons/fam/cross.gif" border="0" /></a>
                                                                    </td>
                                                                </tr>
                                            
                                                                ~~/foreach~
                                            
                                                            </tbody>
                                                        </table>
                                            
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>        
                                            
                                            
                                            
                                                        <!--div class="menu_radio pay">
                                                            <div id="pay_invoice" class="active" onclick="javascript:change_pay('invoice');">Безналичный расчет (для юридических лиц)</div>
                                                        </div-->
                                                        
                                                        <div class="cost_total" style="text-align:right;">К ОПЛАТЕ:&nbsp;&nbsp;&nbsp;<span id="cost_total">~~$cost_total~</span>&nbsp;&nbsp;бел.&nbsp;руб.
                                                            <!--div id="delivery_home" class="~~if $delivery == 'home'~active~~/if~" onclick="javascript:change_delivery('home');">Доставка товара курьером&nbsp;&nbsp;&nbsp;<span class="productSpecialPrice2" style="line-height: 18px; font-weight: normal;">~~*$cost_delivery_home*~ ~~if $cost_total|replace:' ':'' < 300000~ не доставляется - только самовывоз ~~else~ ~~if $cost_total|replace:' ':'' >= 300000 && $cost_total|replace:' ':'' < 900000 ~40 000~~else~0~~/if~ бел.руб.~~/if~</span></div-->
                                                             
                                                        </div>  
                                                        
                                                        <div >
                                                            
                                                            <div>
                                                                <strong>Доставка курьером по Минску:</strong>
                                                                <br>
                                                                При заказе товара на сумму от 300 000 до 900 000 руб, стоимость доставки составит - 40 000 руб *
                                                                <br>
                                                                При заказе на сумму свыше 900 000 руб - бесплатная доставка по Минску (в пределах МКАД) *
                                                                <br>
                                                                Заказы на сумму до 300 000 руб. не доставляются (только самовывоз)
                                                                <br>
                                                                 * Доставка осуществляется до подъезда.
                                                                <br><br><br><br>                                                            
                                                            </div>
                                                            
                                                            
                                                            
                                                            <!--div id="delivery_none" class="~~if $delivery == 'none'~active~~/if~" onclick="javascript:change_delivery('none');">Самовывоз. </div-->
                                                        </div>
                                            

                                                         
                                            
                                                        <style>
                                                            #cartForm { width: 100%; }
                                                            #cartForm input { width: 250px; }
                                                            #cartForm #name { width: 144px; }
                                                            #cartForm #phone { width: 144px; }
                                                            #cartForm input.submit { width: 144px; height: 23px; border: 0; }
                                                            #cartForm #comment { width: 250px; height: 100px; }
                                                            #cartForm label.optional { color: #777; }
                                                            #cartForm .cartForm_invoice { ~~if $pay == 'cash'~display: none;~~/if~ }
                                                        </style>
                                                        
                                                        <form class="cmxform" id="cartForm" method="post" action="/">
                                                            <fieldset>
                                                                <p>
                                                                    <label for="name"><span style="color:red;">*</span> Контактное лицо:</label>
                                                                    <br />
                                                                    <input id="name" name="name" class="input-text" style="padding:0px;width:400px;font-size: 15px !important; height: 21px; margin: 2px;" />
                                                                </p>
                                                                <p>
                                                                    <label for="phone"><span style="color:red;">*</span> Телефон для связи:</label>
                                                                    <br />
                                                                    <input id="phone" name="phone" class="input-text" style="padding:0px;width:400px;font-size: 15px !important; height: 21px; margin: 2px;" />
                                                                </p>
                                                                <p>
                                                                    <label for="phone"> Электронная почта:</label> 
                                                                    <br />
                                                                    <input id="phone" name="email" class="input-text" style="padding:0px;width:400px;font-size: 15px !important; height: 21px; margin: 2px;" />
                                                                </p>
                                                                <!--p>
                                                                    <label for="invoice_orgname" class="optional">Юридическое название организации:</label>
                                                                    <input id="invoice_orgname" name="invoice_orgname" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgaddress" class="optional">Юридический адрес организации:</label>
                                                                    <input id="invoice_orgaddress" name="invoice_orgaddress" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgdirectorname" class="optional">Должность, ФИО руководителя:</label>
                                                                    <input id="invoice_orgdirectorname" name="invoice_orgdirectorname" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgdirectorphone" class="optional">Телефон руководителя:</label>
                                                                    <input id="invoice_orgdirectorphone" name="invoice_orgdirectorphone" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgaccountantphone" class="optional">Телефон бухгалтерии:</label>
                                                                    <input id="invoice_orgaccountantphone" name="invoice_orgaccountantphone"  class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgbankaccount" class="optional">Расчетный счет:</label>
                                                                    <input id="invoice_orgbankaccount" name="invoice_orgbankaccount" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgbankname" class="optional">Банк:</label>
                                                                    <input id="invoice_orgbankname" name="invoice_orgbankname" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgbankcode" class="optional">Код банка:</label>
                                                                    <input id="invoice_orgbankcode" name="invoice_orgbankcode" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgcity" class="optional">Город организации:</label>
                                                                    <input id="invoice_orgcity" name="invoice_orgcity" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgunn" class="optional">УНН:</label>
                                                                    <input id="invoice_orgunn" name="invoice_orgunn" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="invoice_orgokpo" class="optional">ОКПО:</label>
                                                                    <input id="invoice_orgokpo" name="invoice_orgokpo" class="input-text" style="padding:0px; float: right;" />
                                                                </p>
                                                                <p>
                                                                    <label for="email" class="optional">E-mail:</label>
                                                                    <input id="email" name="email" class="input-text" style="padding:0px; float: right;" />
                                                                </p-->
                                                                <p>
                                                                    <label for="address" >Адрес доставки:</label>
                                                                    <br />
                                                                    <input id="address" name="address"  class="input-text" style="padding:0px;width:400px;font-size: 15px !important; height: 21px; margin: 2px;"  />
                                                                </p>
                                                                <p>
                                                                    <label for="comment" >Примечания:</label>
                                                                    <br />
                                                                    <textarea id="comment" name="comment" style="width:400px;font-size: 15px !important; margin: 2px;"></textarea>
                                                                </p>
                                                                <p style="padding:20px;">
                                                                    
                                                                    <button class="button btn-cart" title="Оформить заказ" type="submit">
                                                                        <span><span>Оформить заказ</span></span>
                                                                    </button>
                                                                    
                                                                    <!--input type="submit" value="Заказать" />
                                                                    <input class="submit" type="image" src="/index_files/button_cart.gif" alt="Оформить заказ" title="Оформить заказ" /-->
                                                                </p>
                                                            </fieldset>
                                                            
                                                            Строки обязательные для заполнения отмечены <span style="color:red;">*</span> 
                                                        </form>
                                            
                                                        ~~else~
                                                        <div class="messages_empty_list">Нет позиций в заказе.<br /><br />Для выбора товаров воспользуйтесь меню.</div>
                                                        ~~/if~
                                            
                                                                        </div>
                                            
                                                                      </td>
                                                                    </tr>
                                                                  </tbody></table></td>
                                                              </tr>
                                                            </tbody></table></td>
                                                        </tr>
                                                      </tbody></table></td>
                                                  </tr>
                                                  <tr><td class="prod_line_x padd_vv"  style="height:4px;"></td></tr>
                                                </tbody></table>
                                            
                                            </div>


