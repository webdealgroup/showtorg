                    <table class="infoBoxContents_table" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                        
                        
                        
                        ~~foreach from=$akcii_items item=i~
                        
                            <tr>
                                <td class="stock">
                                    <h4>~~$i.title~</h4>
                                    <p class="stock-text">~~$i.content~</p>
                                </td>
                            </tr>
                            
                        ~~/foreach~
                        
                        </tbody> 
                    </table>