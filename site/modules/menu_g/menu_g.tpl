

                <li>
                    <a href="/">Главная</a>
                </li>

                ~~foreach from=$menu_g item=m~
                <li class="nav__item">
                    <a class="nav__link " href="/pages/~~$m.name~/"><span>~~$m.title~</span></a>
                </li>
                ~~/foreach~
