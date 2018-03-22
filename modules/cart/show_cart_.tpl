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
				if (v.message) {$("#cart_content").html(v.message);window.scrollTo(0, 0);}
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
	table.tableCart td.td_3 { width: 60px; text-align: center; }
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
					<td class="prod2_tr"><table cellspacing="0" cellpadding="0" border="0" class="prod2_bl">
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
						<td class="td_1 th">Наименование </td>
						<td class="td_2 th">Цена/6 мес., бел.руб. с НДС</td>
						<td class="td_3 th">Кол-во экз.</td>
						<td class="td_4 th">Сумма/6 мес., бел.руб. с НДС</td>
						<td class="td_5 th">&nbsp;</td>
					</tr>

					~~foreach from=$items item=i~

					<tr id="tr_~~$i.id~">
						<td class="td_1">
							<input type="hidden" name="message[]" value="~~$i.id~" />
							~~if $i.type==1~Журнал~~/if~~~if $i.type==2~Альманах~~/if~  ~~$i.name~<br />
						</td>
						<td class="td_2">
							<span name="cost_~~$i.id~" id="cost_~~$i.id~" class="productSpecialPrice2">~~$i.cost~</span>
						</td>
						<td class="td_3">
							<input type="text" name="qty_~~$i.id~" size="2" id="qty_~~$i.id~" onchange="javascript:change_qty('~~$i.id~', this.value);" value="~~$i.qty~" style="text-align: right; width: 40px;" />
						</td>
						<td class="td_4">
							<span name="sum_~~$i.id~" id="sum_~~$i.id~" class="productSpecialPrice2">~~$i.sum~</span>
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



			<div class="menu_radio pay">
				<div id="pay_invoice" class="active" onclick="javascript:change_pay('invoice');">Безналичный расчет (для юридических лиц)</div>
			</div>
			
			<!--div class="menu_radio delivery">
				<div id="delivery_home" class="~~if $delivery == 'home'~active~~/if~" onclick="javascript:change_delivery('home');">Доставка товара курьером&nbsp;&nbsp;&nbsp;<span class="productSpecialPrice2" style="line-height: 18px; font-weight: normal;">~~$cost_delivery_home~ бел.руб.</span></div>
				<div id="delivery_none" class="~~if $delivery == 'none'~active~~/if~" onclick="javascript:change_delivery('none');">Самовывоз. Магазин: Малиновка, Строительный рынок «Торговый Мир — Кольцо», (рядом с автомобильным рынком), павильон 40/6</div>
			</div-->

			<div class="cost_total">ИТОГО К ОПЛАТЕ:&nbsp;&nbsp;&nbsp;<span id="cost_total">~~$cost_total~</span>&nbsp;&nbsp;бел.&nbsp;руб. с НДС</div>

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
			
			<form class="cmxform" id="cartForm" method="post" action="">
				<fieldset>
					<p>
						<label for="name"><span style="color:red;">*</span> Контактное лицо:</label>
						<input id="name" name="name" class="cartField" />
					<p>
						<label for="phone"><span style="color:red;">*</span> Телефон для связи:</label>
						<input id="phone" name="phone" />
					</p>
					<p>
						<label for="invoice_orgname" class="optional">Юридическое название организации:</label>
						<input id="invoice_orgname" name="invoice_orgname" />
					</p>
					<p>
						<label for="invoice_orgaddress" class="optional">Юридический адрес организации:</label>
						<input id="invoice_orgaddress" name="invoice_orgaddress" />
					</p>
					<p>
						<label for="invoice_orgdirectorname" class="optional">Должность, ФИО руководителя:</label>
						<input id="invoice_orgdirectorname" name="invoice_orgdirectorname" />
					</p>
					<p>
						<label for="invoice_orgdirectorphone" class="optional">Телефон руководителя:</label>
						<input id="invoice_orgdirectorphone" name="invoice_orgdirectorphone" />
					</p>
					<p>
						<label for="invoice_orgaccountantphone" class="optional">Телефон бухгалтерии:</label>
						<input id="invoice_orgaccountantphone" name="invoice_orgaccountantphone" />
					</p>
					<p>
						<label for="invoice_orgbankaccount" class="optional">Расчетный счет:</label>
						<input id="invoice_orgbankaccount" name="invoice_orgbankaccount" />
					</p>
					<p>
						<label for="invoice_orgbankname" class="optional">Банк:</label>
						<input id="invoice_orgbankname" name="invoice_orgbankname" />
					</p>
					<p>
						<label for="invoice_orgbankcode" class="optional">Код банка:</label>
						<input id="invoice_orgbankcode" name="invoice_orgbankcode" />
					</p>
					<p>
						<label for="invoice_orgcity" class="optional">Город организации:</label>
						<input id="invoice_orgcity" name="invoice_orgcity" />
					</p>
					<p>
						<label for="invoice_orgunn" class="optional">УНН:</label>
						<input id="invoice_orgunn" name="invoice_orgunn" />
					</p>
					<p>
						<label for="invoice_orgokpo" class="optional">ОКПО:</label>
						<input id="invoice_orgokpo" name="invoice_orgokpo" />
					</p>
					<p>
						<label for="email" class="optional">E-mail:</label>
						<input id="email" name="email" />
					</p>
					<p>
						<label for="address" class="optional">Адрес доставки:</label>
						<input id="address" name="address" />
					</p>
					<p>
						<label for="comment" class="optional">Примечания:</label>
						<textarea id="comment" name="comment"></textarea>
					</p>
					<p>
						<input class="submit" type="image" src="/index_files/button_cart.gif" alt="Оформить заказ" title="Оформить заказ" />
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
