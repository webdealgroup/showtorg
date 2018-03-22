<div class="content">
	<div class="infobox_heading mb0">
		Каталог товаров
	</div>

	<div class="catalog">
	<ul>
		~~assign var="level"  value="2"~
		~~foreach item=i from=$menu~
			~~if $i.level > $level~
				~~section name=loop_up start=$level loop=`$i.level`~
					<ul>
				~~/section~
				~~assign var="level" value=`$i.level`~
			~~elseif $i.level < $level~
				~~section name=loop_down start=$i.level loop=$level~
					</ul>
				~~/section~
				~~assign var="level" value=`$i.level`~
			~~/if~
			<li class="~~if $level == 2~first~~/if~ ~~if $i.mylen == 0 && $level > 2~last~~/if~"><a href="?page=~~$i.id~" title="~~$i.title~" class="~~if $level == 2~first~~/if~">~~$i.title~</a></li>
		~~/foreach~
	</ul>
	</div> 
</div>
