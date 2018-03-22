~~include file="cart_add_func.tpl"~

~~* Requires Smarty 2.6.0 or later *~
~~* $data is the array you want to display *~
~~* $numCols is the number of columns *~

~~assign var="numCols"  value="2"~
~~assign var="data"  value=$items~

<div class ="infobox">
<div class = "infobox_heading">       
	Новинки  
</div>
         
         <table cellspacing="0" cellpadding="0" border="0" class="tableBox_output_table">
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
         </table>
</div>
