<?php /* Smarty version 2.6.11, created on 2018-03-22 12:29:47
         compiled from cart/pop_up.tpl */ ?>
<script>

var item_id = null;

function add_cart(cnt) 
{
    //alert("id");
	var pars = {
		mod_name: "cart",
		action: "add_cart",
		id: item_id,
       qty: cnt
	};

	$.post('/index.php', pars, function(v){
		if (v.cart_short_count)
			$('#cart_short_count').html(v.cart_short_count);
		if (v.cart_short_sum)
			$('#cart_short_sum').html(v.cart_short_sum);
		/*if (v.message)
			show_info_fixed(v.message);*/
            
            $('#info_fixed').hide();
            $('#TB_overlay').hide();
            $('#qty_id').val('1'); 
            
	}, 'json');
}

timer_info_fixed = null;

function show_info_fixed(id)
{

    item_id = id;
    
    stop_info_fixed_timer();
	var block = document.getElementById('info_fixed');
	block.parentNode.removeChild(block);
	document.getElementsByTagName("body")[0].appendChild(block);
	//$('#info_fixed_text').html(message);
	
    $('#TB_overlay').show();
    
    $('#info_fixed').is(':hidden')
		$('#info_fixed').show();
	//timer_info_fixed = window.setTimeout(hide_info_fixed, 3000);
}

function hide_info_fixed()
{
	stop_info_fixed_timer();
	$('#info_fixed').is(':visible')
		$('#info_fixed').hide();
       
       $('#TB_overlay').hide();
    
}

function stop_info_fixed_timer()
{
	if (timer_info_fixed)
		clearTimeout(timer_info_fixed);
}

</script>

<style>
.info_fixed { position: absolute; left: 40%; bottom: 50%; z-index: 1111; width: 300px; display: block; display: none; background: #fafafa; border: 3px solid #e2e6e9; -moz-border-radius: 16px; -webkit-border-radius: 16px; padding: 10px; }
body > div.info_fixed { position: fixed; z-index: 1111; /* used by Opera 5+, Netscape6+/Mozilla, Konqueror, Safari, OmniWeb 4.5+, iCab, ICEbrowser */ }
.info_fixed a { font-weight: bold; color: #76B013; text-decoration: underline; }
.info_fixed_text { line-height: 20px; text-align: center; margin-bottom: 7px; }
</style>

<div class="info_fixed" id="info_fixed" >
    <div style="text-align:right;"><a href="#" onclick="javascript:hide_info_fixed();">x</a></div>
    <form>
         <span style="color:#14282f;font-size:15px;"><b>Добавление товара в корзину</b></span><br>
         Укажите количество<br><br>
         
        
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
        
					<input class="quantity-controls quantity-minus" type="button" onclick="if ($('#qty_id').val()>1) {$('#qty_id').val( $('#qty_id').val()-1 );} ">
                    <input type="text" class="input-text" name="count"  id='qty_id' value="1"  style="width: 20px;text-align:center; font-size:14px;"/>
					<input class="quantity-controls quantity-plus" type="button" onclick="$('#qty_id').val( Number($('#qty_id').val())+1 ); ">


        <br><br>
        <button onclick="javascript: if(item_id) { add_cart($('#qty_id').val());return false;}else alert('no item_id');" class="button btn-cart" title="Добавить" type="button">
                                                    <span><span>Добавить</span></span>
                                                </button>
                                                
                                                
                                                &nbsp;
                                                
                                                <button class="button btn-cart" title="Отменить" type="button" onclick="javascript:hide_info_fixed();">
                                                    <span style="background-position:0 -22px;"><span style="background-position:100% -22px; color:#777;">Отменить</span></span>
                                                </button>
                                                
    </form>
	<div class="info_fixed_text" id="info_fixed_text" style="display:none;">&nbsp;</div>
</div>

<div id="TB_overlay" style="display:none;"></div>


<style>
#TB_overlay {
  background-color: #000; /* Чёрный фон */
  height: 100%; /* Высота максимальна */
  left: 0; /* Нулевой отступ слева */
  opacity: 0.50; /* Степень прозрачности */
  position: fixed; /* Фиксированное положение */
  top: 0; /* Нулевой отступ сверху */
  width: 100%; /* Ширина максимальна */
  z-index: 100; /* Заведомо быть НАД другими элементами */
}
</style>