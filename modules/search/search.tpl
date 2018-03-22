~~include file="cart_add_func.tpl"~

~~* Requires Smarty 2.6.0 or later *~
~~* $data is the array you want to display *~
~~* $numCols is the number of columns *~

~~assign var="numCols"  value="3"~
~~assign var="data"  value=$list_nodes~

<div class="content">

	<div class="infobox_heading">
		Результаты поиска по ключевой фразе "<strong>~~$searchword~</strong>"
		<br />Найдено результатов: <strong>~~$count~</strong>
	</div>

	~~if $data.0.id != ""~
	
		<div style="text-align: left;">

			<table width="100%" cellspacing="0" cellpadding="0">
				<tbody>
							  
					~~assign var="col" value="0"~
					~~section name=element loop=$data~
						~~if $col == $numCols~
							</tr><tr><td class="prod_line_x padd_vv"  style="height:4px;"></td></tr><tr>~~assign var="col" value="0"~
						~~/if~
							<td width="33%" align="center">

		<table cellspacing="0" cellpadding="0" border="0" align="center" class="prod2_t prod_table" >
		  <tbody><tr>
			<td align="center" class="prod2_r"><table cellspacing="0" cellpadding="0" border="0" class="prod2_b">
				<tbody><tr>
				  <td class="prod2_l"><table cellspacing="0" cellpadding="0" border="0" class="prod2_tl">
					  <tbody><tr>
						<td class="prod2_tr"><table cellspacing="0" cellpadding="0" border="0" class="prod2_bl" style="height:150px;">
							<tbody><tr>
							  <td class="prod2_br prod_td"><table cellspacing="0" cellpadding="0" border="0">
								  <tbody><tr>
									<td class="pic4_padd"><table cellspacing="0" cellpadding="0" border="0" align="center" class="pic_table">
										<tbody><tr>
										  <td class="pic_td">~~if $data[element].image != ""~<a href="?page=~~$data[element].id~"><img border="0" src="imgThumb.php?src=/img/~~$data[element].id~/~~$data[element].image~&max_x=80&max_y=80"/></a>~~/if~</td>
										</tr>
									  </tbody></table></td>
								  </tr>
								  <tr>
									<td class="name name4_padd" style="text-align:center;"><a href="?page=~~$data[element].id~" class="ttle">~~$data[element].title~</a></td>
								  </tr>
								</tbody></table></td>
							</tr>
						  </tbody></table></td>
					  </tr>
					</tbody></table></td>
				</tr>
			  </tbody></table></td>
		  </tr>
		</tbody></table>
							
			   
							</td>
		~~if $col < "2" ~<td class="prod_line_y padd_vv"><img height="1" border="0" width="1" alt="" src="index_files/pixel_trans.gif"></td>~~/if~

						   ~~assign var="col" value="`$col+1`"~
					~~/section~
					~~assign var="remainder" value="`$numCols-$col`"~
					~~section name=emptyElement loop=$remainder~
						<td>&nbsp;</td>
		~~if $col < "2" ~<td class="prod_line_y padd_vv"><img height="1" border="0" width="1" alt="" src="index_files/pixel_trans.gif"></td>~~/if~                
					~~/section~
					</tr><tr><td class="prod_line_x padd_vv" style="height:4px;"></td></tr>
				</tbody>
			</table>
		</div>
	~~/if~

	~~if $items.0.name != ""~

	~~include file="items/items_list.tpl"~

	~~else~

	По вашему запросу ничего не найдено.<br />
	Попробуйте упростить поисковую фразу, либо воспользуйтесь <a href="/?mod_name=catalog" title="Каталог товаров">каталогом товаров</a>.

	~~/if~
	
</div>
