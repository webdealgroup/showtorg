
    ~~foreach from=$items item=i~


          

<td style="align: center; valign: middle; padding: 20px 33px 0px 10px;">


<a href="?mod_name=item&id=~~$i.id~" target="_blank">
            <img src="/img/~~$i.node~/~~$i.image~" alt="~~$i.name~" title="~~$i.name~" border="0" height="180">                            
        </a>
</td>
        ~~/foreach~
