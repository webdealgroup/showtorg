~~debug~
 
                ~~foreach name=vmenu  from=$menu item=i~

                ~~if $i.parent == 1~
                  <li class="categories-menu__item categories-menu__item--sub">
                    
                    <div class="categories-menu__item-inn">
                      <a href="/~~$i.name~/" class="categories-menu__link">~~$i.title~</a>
                    </div>

                  </li>
                ~~/if~
                ~~/foreach~





