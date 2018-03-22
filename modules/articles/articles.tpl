
                        
                        
                        ~~foreach from=$articles_items item=i~
                        
                            <div class="item">
                                <div class="photo"> 
                                    <a href="?mod_name=art&id=~~$i.id~"> 
                                        ~~$i.image~
                                    </a> 
                                </div>
                                
                                <h2>
                                    <a href="?mod_name=art&id=~~$i.id~">~~$i.title~</a>
                                </h2>
                                <p class="description">
                                    ~~$i.content~
                                </p>
                                <div class="clear"></div> 
                            </div>

                        ~~/foreach~
                        
