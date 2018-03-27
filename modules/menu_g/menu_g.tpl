

                <li>
                    <a href="/">Главная</a>
                </li>

                ~~foreach from=$menu_g item=m~
                <li class="nav__item">
                    <a class="nav__link " href="/?mod_name=page&id=~~$m.name~"><span>~~$m.title~</span></a>
                </li>
                ~~/foreach~
