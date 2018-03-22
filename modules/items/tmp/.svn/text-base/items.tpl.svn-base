{if $items.0.name != ""}
		<div style="margin-left:29px; margin-top:10px "><strong>{$page}</strong> [Страница - {$list}]</div>


{* Requires Smarty 2.6.0 or later *}
{* $data is the array you want to display *}
{* $numCols is the number of columns *}

{assign var="numCols"  value="2"}
{assign var="data"  value=$items}

<table width="80%" border="0" cellspacing="5" cellpadding="5">
                      
    {assign var="col" value="0"}
    {section name=element loop=$data}
        {if $col == $numCols}
            </tr><tr>{assign var="col" value="0"}
        {/if}
            <td bgcolor="#ffffff">

	<div style="margin-left:3px; margin-top:4px "><img src="img/{$data[element].picture}"></div>
	<div><table width="150"  border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td ><div class="blue" style="margin-left:10px; margin-top:8px "><strong>{$data[element].name}</strong></div>
	<div style="margin-left:10px; margin-top:2px; width:161px ">
   
</div>

</td>
  </tr>
</table>
</div>

            </td>
           {assign var="col" value="`$col+1`"}
    {/section}
    {assign var="remainder" value="`$numCols-$col`"}
    {section name=emptyElement loop=$remainder}
        <td>&nbsp;</td>
    {/section}
    </tr>
</table>

{/if}

{$content}
