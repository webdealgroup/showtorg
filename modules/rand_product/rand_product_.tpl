<script type="text/javascript">

function add_cart(id) 
{
	var pars = {
		mod_name: "cart",
		action: "add_cart",
		id: id
	};

	$.post('/index.php', pars, function(v){
		if (v.cart_short_count)
			$('#cart_short_count').html(v.cart_short_count);
		if (v.cart_short_sum)
			$('#cart_short_sum').html(v.cart_short_sum);
		if (v.message)
			show_info_fixed(v.message);
	}, 'json');
}

timer_info_fixed = null;

function show_info_fixed(message)
{
	stop_info_fixed_timer();
	var block = document.getElementById('info_fixed');
	block.parentNode.removeChild(block);
	document.getElementsByTagName("body")[0].appendChild(block);
	$('#info_fixed_text').html(message);
	$('#info_fixed').is(':hidden')
		$('#info_fixed').show();
	timer_info_fixed = window.setTimeout(hide_info_fixed, 5000);
}

function hide_info_fixed()
{
	stop_info_fixed_timer();
	$('#info_fixed').is(':visible')
		$('#info_fixed').hide();
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

<div class="info_fixed" id="info_fixed" onclick="javascript:hide_info_fixed();">
	<div class="infobox_heading">Информация</div>
	<div class="info_fixed_text" id="info_fixed_text">&nbsp;</div>
</div>

~~* Requires Smarty 2.6.0 or later *~
~~* $data is the array you want to display *~
~~* $numCols is the number of columns *~

~~assign var="numCols"  value="2"~
~~assign var="data"  value=$items~



         
         <!--table cellspacing="0" cellpadding="0" border="0" class="tableBox_output_table">
          <tbody>
           <tr>
            <td class="main">

             <table width="100%" cellspacing="0" cellpadding="0" border="0">
              <tbody>
               <tr>
               
		    ~~assign var="col" value="0"~
		    ~~section name=element loop=$data~
		        ~~if $col == $numCols~
		       </tr>
               <tr>
                <td colspan="3" class="prod_line_x padd_gg">
                 <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                </td>
               </tr>

               <tr>~~assign var="col" value="0"~
		        ~~/if~
                
                <td align="center" style="width: 50%;">
                 <table cellspacing="0" cellpadding="0" border="0" align="center" class="prod2_t prod2_table">
                  <tbody>
                   <tr>
                    <td align="center" class="prod2_r">
                     <table cellspacing="0" cellpadding="0" border="0" class="prod2_b">
                      <tbody>
                       <tr>
                        <td class="prod2_l">
                         <table cellspacing="0" cellpadding="0" border="0" class="prod2_tl">
                          <tbody>
                           <tr>
                            <td class="prod2_tr">
                             <table cellspacing="0" cellpadding="0" border="0" class="prod2_bl">
                              <tbody>
                               <tr>
                                <td class="prod2_br prod_td">
                                 <table cellspacing="0" cellpadding="0" border="0" style="height:240px;">
                                  <tbody>
                                   <tr>
                                    <td class="new">
                                     <table cellspacing="0" cellpadding="0" border="0">
                                      <tbody>
                                       <tr>
                                        <td class="name name2_padd"  style="height:65px;">
                                         <a href="/?mod_name=item&id=~~$data[element].id~">~~$data[element].name~</a>
                                        </td>
                                       </tr>
                                       <tr>
                                        <td class="pic2_padd">
                                         <table cellspacing="0" cellpadding="0" border="0" align="center" valign="center" class="pic_table"  style="height:160px;">
                                          <tbody>
                                           <tr>
                                            <td class="pic_td">
                                             ~~if $data[element].image != ""~<a href="/?mod_name=item&id=~~$data[element].id~" title="~~$data[element].name~"><img border="0" src="/imgThumb.php?src=/img/~~$data[element].dir~/~~$data[element].image~&max_x=160&max_y=160" alt="~~$data[element].name~"/></a>~~/if~
                                            </td>
                                           </tr>
                                          </tbody>
                                         </table>
                                        </td>
                                       </tr>
                                       <tr>
                                        <td>
                                         <table cellspacing="0" cellpadding="0" border="0" class="wrapper_name_t">
                                          <tbody>
                                           <tr>
                                            <td class="wrapper_name_b">
                                             <table cellspacing="0" cellpadding="0" border="0" class="wrapper_name_r">
                                              <tbody>
                                               <tr>
                                                <td class="wrapper_name_l">
                                                 <table cellspacing="0" cellpadding="0" border="0" class="wrapper_name_tl">
                                                  <tbody>
                                                   <tr>
                                                    <td class="wrapper_name_tr">
                                                     <table cellspacing="0" cellpadding="0" border="0" class="wrapper_name_bl">
                                                      <tbody>
                                                       <tr>
                                                        <td class="wrapper_name_br">
                                                         <table cellspacing="0" cellpadding="0" border="0">
                                                          <tbody>
                                                           <tr>
                                                            <td class="price2_padd">
                                                             <strong>Цена: </strong>
                                                             <span class="productSpecialPrice2">&nbsp;&nbsp;~~$data[element].cost~<span lang="ru">р.</span></span>
                                                             ~~*if $data[element].credit != "" ~<br /><strong>В кредит: </strong>
                                                             <span class="productSpecialPrice2">&nbsp;~~$data[element].credit~<span lang="ru">р.</span></span>~~/if*~
                                                            </td>
                                                            <td>
                                                             <img height="55" width="1" border="0" alt="" src="index_files/part.gif">
                                                            </td>
                                                            <td class="button2_padd button2_marg">
                                                             <table cellspacing="0" cellpadding="0" border="0">
                                                              <tbody>
                                                               <tr>
                                                                <td>
                                                                 <a href="/?mod_name=item&id=~~$data[element].id~"><input type="image" title=" Подробнее " alt="Подробнее" src="index_files/more_info.gif" style="border: 0pt none;"></a>
                                                                 <br>
                                                                 <a href="#" onclick="javascript:add_cart(~~$data[element].id~);return false;" title="Добавить в корзину"><img height="23" width="79" border="0" alt="Добавить в корзину" src="index_files/button_in_cart.gif" /></a>
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
                </td>
                ~~if $col < "1" ~
                <td class="padd_vv">
                 <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                </td>
                ~~/if~
                
		           ~~assign var="col" value="`$col+1`"~
		    ~~/section~
		    ~~assign var="remainder" value="`$numCols-$col`"~
		    ~~section name=emptyElement loop=$remainder~
		        <td>&nbsp;</td>
                ~~if $col < "1" ~
                <td class="padd_vv">
                 <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                </td>
                ~~/if~
		    ~~/section~
            
               </tr>               
               <tr>
                <td colspan="3" class="prod_line_x padd_gg">
                 <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                </td>
               </tr>
              </tbody>
             </table>
            </td>
           </tr>
          </tbody>
         </table-->





~~* Requires Smarty 2.6.0 or later *~
~~* $data is the array you want to display *~
~~* $numCols is the number of columns *~

~~assign var="numCols"  value="4"~
~~assign var="data"  value=$items~





                                                                                        
                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td class="tableBox_output_td main">
                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="">
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                
                                                                                                                		    ~~assign var="col" value="0"~
                                                                                                                            ~~section name=element loop=$data~
                                                                                                                                ~~if $col == $numCols~
                                                                                                                               </tr>
                                                                                                                                <tr>
                                                                                                                                    <td class="prod_line_x padd_gg" colspan="8">
                                                                                                                                        <img width="1" height="1" border="0" alt="" src="/index_files/spacer.gif">
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                               <tr>~~assign var="col" value="0"~
                                                                                                                                ~~/if~
                                                                                                                                
                                    
                                                                                                                    <td style="width: 25%;" align="center">
                    <div class="m_bg">
                        <div class="m_tl">
                            <div class="m_tr">
                                <div class="m_bl">
                                    <div class="m_br" style="padding: 10px 0;">
                                                                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td style="padding: 3px 15px 7px; height: 320px;">
                                                                                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                                                                                            <tbody>
                                                                                                                                                <tr>
                                                                                                                                                    <td>
                                                                                                                                                        <table style="width: 1px;" align="center" border="0" cellpadding="0" cellspacing="0">
                                                                                                                                                            <tbody>
                                                                                                                                                                <tr>
                                                                                                                                                                    <td>
                                                                                                                                                                        <a href="/?mod_name=item&id=~~$data[element].id~"><img src="/imgThumb.php?src=/img/~~$data[element].dir~/~~$data[element].image~&max_x=120&max_y=148" alt="" title="" border="0" height="148" width="120"></a>
                                                                                                                                                                    </td>
                                                                                                                                                                </tr>
                                                                                                                                                            </tbody>
                                                                                                                                                        </table>
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td class="name name2_padd">
                                                                                                                                                        <a href="/?mod_name=item&id=~~$data[element].id~" style="font-size: 11px;">~~if $data[element].type==1~Журнал~~/if~~~if $data[element].type==2~Альманах~~/if~ ~~$data[element].name~</a>
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                            </tbody>
                                                                                                                                        </table>
                                                                                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                                                                                            <tbody>
                                                                                                                                                <tr>
                                                                                                                                                    <td class="price2_padd vam">
                                                                                                                                                        <span class="productSpecialPrice" style="font-size: 13px;"><span style="font-size: 14px;font-weight: 600;">~~$data[element].cost~<span lang="ru">р.</span></span><br>за 6 мес.</span>
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td class="button2_padd button_marg vam">
                                                                                                                                                        <a href="#" onclick="javascript:add_cart(~~$data[element].id~);return false;" title="Заказ"><img height="23" width="79" border="0" alt="Добавить в корзину" src="index_files/button_in_cart.gif" /></a>
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                            </tbody>
                                                                                                                                        </table>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                                                                                                                    </td>
                                                                                                                    
                                                                                                                    ~~if $col< 3 ~
                                                                                                                    <td class="prod_line_y padd_vv">
                                                                                                                        <img width="1" height="1" border="0" alt="" src="/index_files/spacer.gif">
                                                                                                                    </td>
                                                                                                                    ~~/if~
                                                                                                                    

                                                                                                                        
                                                                                                                    ~~assign var="col" value="`$col+1`"~
                                                                                                                    ~~/section~
                                                                                                                    ~~assign var="remainder" value="`$numCols-$col`"~
                                                                                                                    ~~section name=emptyElement loop=$remainder~
                                                                                                                        <td>&nbsp;</td>
                                                                                                                       
                                                                                                                        <td class="prod_line_y padd_vv" style="">
                                                                                                                         <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                                                                                                                        </td>
                                                                                                                       
                                                                                                                    ~~/section~
                                                                                                                    
                                                                                                                    
                                                                                                                
                                                                                                                
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        

<br>
<h4>Все издания ( <b style="color:#83c11a;">~~$num_items~</b> ) смотрите в разделе "Каталог изданий" </h4> 
                                    

