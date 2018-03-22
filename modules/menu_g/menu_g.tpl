                                <li>
                                    <a href="/">Главная</a>
                                </li>

                                                                                                                            
                                                                                                                            ~~foreach name=tmenu  from=$menu_g item=i~
                                <li>
                                    <a href="/?mod_name=page&id=~~$i.name~">~~$i.title~</a>
                                </li>

                                                                                                                            ~~*if $smarty.foreach.tmenu.last != $smarty.foreach.tmenu.total~

                                                                                                                            ~~/if*~
                                                                                                                            ~~/foreach~

                                           
                                           
                    