                                <li>
                                    <a  style="background-position: -110px 15px;"  href="/">Главная</a>
                                </li>

                                                                                                                            
                                                                                                                            ~~foreach name=tmenu  from=$menu_g item=i~
                                <li>
                                    <a  style="background-position: -110px 15px;"  href="/?mod_name=page&id=~~$i.name~">~~$i.title~</a>
                                </li>

                                                                                                                            ~~*if $smarty.foreach.tmenu.last != $smarty.foreach.tmenu.total~

                                                                                                                            ~~/if*~
                                                                                                                            ~~/foreach~

                                           
                                           
                    